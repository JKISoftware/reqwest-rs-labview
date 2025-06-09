use crate::{RequestStatus, Response};
use reqwest::{header::HeaderMap, StatusCode};
use std::sync::{Arc, RwLock};
use tokio::time::timeout;
use std::time::Duration;

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
                let error_response = Response {
                    status: StatusCode::INTERNAL_SERVER_ERROR,
                    headers: HeaderMap::new(),
                    body: Err(format!("Failed to create file: {}", e)),
                };
                
                // Update progress
                let mut progress = progress_info.write().unwrap();
                progress.status = RequestStatus::Error;
                progress.final_response = Some(error_response);
                return;
            }
        }
    } else {
        None
    };

    // Add a timeout to the request to prevent hanging
    let request_future_with_timeout = timeout(Duration::from_secs(30), request_future);
    let result = match request_future_with_timeout.await {
        // Request completed within timeout
        Ok(inner_result) => inner_result,
        // Timeout occurred
        Err(_) => {
            let timeout_response = Response {
                status: StatusCode::REQUEST_TIMEOUT,
                headers: HeaderMap::new(),
                body: Err("Request timed out".to_string()),
            };
            
            // Only update if not already cancelled
            if progress_info.read().unwrap().status != RequestStatus::Cancelled {
                let mut progress = progress_info.write().unwrap();
                progress.status = RequestStatus::Error;
                progress.final_response = Some(timeout_response);
            }
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
            
            // Update the total bytes
            {
                let mut progress = progress_info.write().unwrap();
                progress.total_bytes = total_size;
            }

            // Pre-allocate buffer with a reasonable size limit to prevent OOM
            const MAX_BUFFER_SIZE: usize = 10 * 1024 * 1024; // 10 MB limit
            let mut received_data = if file.is_none() {
                Some(Vec::with_capacity(total_size.unwrap_or(8192).min(MAX_BUFFER_SIZE as u64) as usize))
            } else {
                None
            };

            // Use a reasonable chunk size to balance performance and memory usage
            const CHUNK_SIZE_LIMIT: usize = 128 * 1024; // 128 KB chunks (slightly reduced)
            let mut chunk_count = 0;

            loop {
                // Only check for cancellation every few chunks
                if chunk_count % 5 == 0 && progress_info.read().unwrap().status == RequestStatus::Cancelled {
                    return;
                }

                // Add timeout for each chunk to prevent hanging
                let chunk_result = timeout(Duration::from_secs(10), resp.chunk()).await;

                let chunk_opt = match chunk_result {
                    Ok(res) => match res {
                        Ok(chunk) => chunk,
                        Err(e) => {
                            let error_response = Response {
                                status,
                                headers: headers.clone(),
                                body: Err(format!("Error reading response: {}", e)),
                            };
                            
                            let mut progress = progress_info.write().unwrap();
                            progress.status = RequestStatus::Error;
                            progress.final_response = Some(error_response);
                            break;
                        }
                    },
                    Err(_) => {
                        // Chunk timeout
                        let timeout_response = Response {
                            status,
                            headers: headers.clone(),
                            body: Err("Timeout while reading response chunk".to_string()),
                        };
                        
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Error;
                        progress.final_response = Some(timeout_response);
                        break;
                    }
                };
                
                match chunk_opt {
                    Some(chunk) => {
                        // Safety check: prevent processing too many chunks
                        chunk_count += 1;
                        if chunk_count > 10000 {
                            let error_response = Response {
                                status,
                                headers: headers.clone(),
                                body: Err("Response too large".to_string()),
                            };
                            
                            let mut progress = progress_info.write().unwrap();
                            progress.status = RequestStatus::Error;
                            progress.final_response = Some(error_response);
                            break;
                        }

                        // Check if chunk is too large (possible DoS)
                        if chunk.len() > CHUNK_SIZE_LIMIT {
                            let error_response = Response {
                                status,
                                headers: headers.clone(),
                                body: Err("Response chunk too large".to_string()),
                            };
                            
                            let mut progress = progress_info.write().unwrap();
                            progress.status = RequestStatus::Error;
                            progress.final_response = Some(error_response);
                            break;
                        }

                        // We don't need to check for cancellation on every chunk
                        // as we're already checking at the start of the loop
                        
                        if let Some(f) = &mut file {
                            if let Err(e) = std::io::Write::write_all(f, &chunk) {
                                let error_response = Response {
                                    status,
                                    headers: headers.clone(),
                                    body: Err(format!("Error writing to file: {}", e)),
                                };
                                
                                let mut progress = progress_info.write().unwrap();
                                progress.status = RequestStatus::Error;
                                progress.final_response = Some(error_response);
                                break;
                            }
                        } else if let Some(data) = &mut received_data {
                            // Check if buffer would become too large
                            if data.len() + chunk.len() > MAX_BUFFER_SIZE {
                                let error_response = Response {
                                    status,
                                    headers: headers.clone(),
                                    body: Err("Response too large for memory buffer".to_string()),
                                };
                                
                                let mut progress = progress_info.write().unwrap();
                                progress.status = RequestStatus::Error;
                                progress.final_response = Some(error_response);
                                break;
                            }
                            data.extend_from_slice(&chunk);
                        }

                        // Update received bytes
                        {
                            let mut progress = progress_info.write().unwrap();
                            if progress.status == RequestStatus::InProgress {
                                progress.received_bytes += chunk.len() as u64;
                            }
                        }
                    }
                    None => {
                        // All chunks received, complete the request
                        let success_response = Response {
                            status,
                            headers,
                            body: Ok(received_data.unwrap_or_default()),
                        };
                        
                        // Complete the request
                        let mut progress = progress_info.write().unwrap();
                        if progress.status == RequestStatus::InProgress {
                            progress.final_response = Some(success_response);
                            progress.status = RequestStatus::Completed;
                        }
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
            
            let error_response = Response {
                status: StatusCode::INTERNAL_SERVER_ERROR,
                headers: HeaderMap::new(),
                body: Err(format!("Error sending request: {}", e)),
            };
            
            let mut progress = progress_info.write().unwrap();
            progress.status = RequestStatus::Error;
            progress.final_response = Some(error_response);
        }
    }
} 