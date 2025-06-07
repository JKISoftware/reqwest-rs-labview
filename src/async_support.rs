use crate::{RequestStatus, Response};
use reqwest::{header::HeaderMap, StatusCode};
use std::sync::{Arc, RwLock};

// Spawns a new task to handle the request and process the response stream.
pub(crate) fn spawn_and_process_request(
    request_future: impl std::future::Future<Output = reqwest::Result<reqwest::Response>> + Send + 'static,
    progress_info: Arc<RwLock<super::RequestProgress>>,
    file_path_str: Option<String>,
) {
    tokio::spawn(async move {
        let mut file = if let Some(path) = &file_path_str {
            match std::fs::File::create(path) {
                Ok(f) => Some(f),
                Err(e) => {
                    let mut progress = progress_info.write().unwrap();
                    progress.status = RequestStatus::Error;
                    let response = Response {
                        status: StatusCode::INTERNAL_SERVER_ERROR,
                        headers: HeaderMap::new(),
                        body: Err(format!("Failed to create file: {}", e)),
                    };
                    progress.final_response = Some(response);
                    return;
                }
            }
        } else {
            None
        };

        let result = request_future.await;

        match result {
            Ok(mut resp) => {
                let status = resp.status();
                let headers = resp.headers().clone();
                let total_size = resp.content_length();
                {
                    let mut progress = progress_info.write().unwrap();
                    progress.total_bytes = total_size;
                }

                let mut received_data = if file.is_none() {
                    Some(Vec::with_capacity(total_size.unwrap_or(0) as usize))
                } else {
                    None
                };

                loop {
                    if progress_info.read().unwrap().status == RequestStatus::Cancelled {
                        return;
                    }

                    match resp.chunk().await {
                        Ok(Some(chunk)) => {
                            if let Some(f) = &mut file {
                                if let Err(e) = std::io::Write::write_all(f, &chunk) {
                                    let mut progress = progress_info.write().unwrap();
                                    progress.status = RequestStatus::Error;
                                    let response = Response {
                                        status,
                                        headers,
                                        body: Err(format!("Error writing to file: {}", e)),
                                    };
                                    progress.final_response = Some(response);
                                    break;
                                }
                            } else if let Some(data) = &mut received_data {
                                data.extend_from_slice(&chunk);
                            }

                            {
                                let mut progress = progress_info.write().unwrap();
                                if progress.status == RequestStatus::InProgress {
                                    progress.received_bytes += chunk.len() as u64;
                                }
                            }
                        }
                        Ok(None) => {
                            let mut progress = progress_info.write().unwrap();
                            if progress.status == RequestStatus::InProgress {
                                progress.status = RequestStatus::Completed;
                                let response = Response {
                                    status,
                                    headers,
                                    body: Ok(received_data.unwrap_or_default()),
                                };
                                progress.final_response = Some(response);
                            }
                            break;
                        }
                        Err(e) => {
                            let mut progress = progress_info.write().unwrap();
                            progress.status = RequestStatus::Error;
                            let response = Response {
                                status,
                                headers,
                                body: Err(format!("Error reading response: {}", e)),
                            };
                            progress.final_response = Some(response);
                            break;
                        }
                    }
                }
            }
            Err(e) => {
                let mut progress = progress_info.write().unwrap();
                progress.status = RequestStatus::Error;
                let response = Response {
                    status: StatusCode::INTERNAL_SERVER_ERROR,
                    headers: HeaderMap::new(),
                    body: Err(format!("Error sending request: {}", e)),
                };
                progress.final_response = Some(response);
            }
        }
    });
} 