use crate::{RequestStatus, Response};
use reqwest::{header::HeaderMap, StatusCode};
use std::sync::{Arc, RwLock};

// Process a request and handle the response stream within an async context
pub(crate) async fn process_request(
    request_future: impl std::future::Future<Output = reqwest::Result<reqwest::Response>>,
    progress_info: Arc<RwLock<super::RequestProgress>>,
    file_path_str: Option<String>,
) {
    // Check if the request is already cancelled before we start
    if progress_info.read().unwrap().status == RequestStatus::Cancelled {
        return;
    }

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

    // Race between the request future and a check for cancellation
    let result = tokio::select! {
        result = request_future => result,
        _ = async {
            loop {
                // Check if the request has been cancelled
                if progress_info.read().unwrap().status == RequestStatus::Cancelled {
                    break;
                }
                tokio::time::sleep(std::time::Duration::from_millis(10)).await;
            }
        } => {
            // The request was cancelled, so we return a cancellation response
            let mut progress = progress_info.write().unwrap();
            if progress.status == RequestStatus::Cancelled {
                // Already marked as cancelled, nothing to do
                return;
            }
            progress.status = RequestStatus::Cancelled;
            let response = Response {
                status: StatusCode::REQUEST_TIMEOUT,
                headers: HeaderMap::new(),
                body: Err("Request cancelled".to_string()),
            };
            progress.final_response = Some(response);
            return;
        }
    };

    match result {
        Ok(mut resp) => {
            // Check once more for cancellation after we get the response
            if progress_info.read().unwrap().status == RequestStatus::Cancelled {
                return;
            }

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
                // Check for cancellation before processing each chunk
                if progress_info.read().unwrap().status == RequestStatus::Cancelled {
                    return;
                }

                match resp.chunk().await {
                    Ok(Some(chunk)) => {
                        // Check again for cancellation
                        if progress_info.read().unwrap().status == RequestStatus::Cancelled {
                            return;
                        }

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
            // Check if it was cancelled
            if progress_info.read().unwrap().status == RequestStatus::Cancelled {
                return;
            }

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
}
