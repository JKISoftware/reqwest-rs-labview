use crate::types::{RequestProgress, RequestStatus, Response};
use reqwest::Response as ReqwestResponse;
use std::{
    fs::File,
    future::Future,
    io::Write,
    sync::{Arc, RwLock},
};

// Process a request and handle the response stream within an async context
pub async fn process_request(
    request_future: impl Future<Output = reqwest::Result<ReqwestResponse>>,
    progress_info: Arc<RwLock<RequestProgress>>,
    output_file_path: Option<String>,
) {
    match request_future.await {
        Ok(response) => {
            // Get the status code and headers before consuming the response
            let status = response.status();
            let headers = response.headers().clone();

            // Check if we're streaming to a file
            if let Some(file_path) = output_file_path {
                // Open the file for writing
                match File::create(&file_path) {
                    Ok(mut file) => {
                        // Get the content length if available
                        let content_length = response
                            .headers()
                            .get(reqwest::header::CONTENT_LENGTH)
                            .and_then(|v| v.to_str().ok())
                            .and_then(|s| s.parse::<u64>().ok());

                        // Update the progress info with the total size
                        if let Some(total) = content_length {
                            let mut progress = progress_info.write().unwrap();
                            progress.total_bytes = Some(total);
                        }

                        // Stream the body to the file
                        let mut stream = response.bytes_stream();
                        let mut received_bytes: u64 = 0;

                        use futures_util::StreamExt;
                        while let Some(chunk_result) = stream.next().await {
                            match chunk_result {
                                Ok(chunk) => {
                                    // Write the chunk to the file
                                    if let Err(e) = file.write_all(&chunk) {
                                        // File write error
                                        let mut progress = progress_info.write().unwrap();
                                        progress.status = RequestStatus::Error;
                                        progress.final_response = Some(Response {
                                            status,
                                            headers,
                                            body: Err(format!("File write error: {e}")),
                                        });
                                        return;
                                    }

                                    // Update received bytes
                                    received_bytes += chunk.len() as u64;
                                    let mut progress = progress_info.write().unwrap();
                                    progress.received_bytes = received_bytes;
                                }
                                Err(e) => {
                                    // Network error
                                    let mut progress = progress_info.write().unwrap();
                                    progress.status = RequestStatus::Error;
                                    progress.final_response = Some(Response {
                                        status,
                                        headers,
                                        body: Err(format!("Network error: {e}")),
                                    });
                                    return;
                                }
                            }
                        }

                        // Successfully completed
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Completed;
                        progress.final_response = Some(Response {
                            status,
                            headers,
                            body: Ok(Vec::new()), // Empty body since it was streamed to file
                        });
                    }
                    Err(e) => {
                        // File open error
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Error;
                        progress.final_response = Some(Response {
                            status,
                            headers,
                            body: Err(format!("File open error: {e}")),
                        });
                    }
                }
            } else {
                // Not streaming to a file, collect the whole body
                match response.bytes().await {
                    Ok(bytes) => {
                        let bytes_vec = bytes.to_vec();
                        let bytes_len = bytes_vec.len() as u64;

                        // Update progress
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Completed;
                        progress.received_bytes = bytes_len;
                        progress.total_bytes = Some(bytes_len);
                        progress.final_response = Some(Response {
                            status,
                            headers,
                            body: Ok(bytes_vec),
                        });
                    }
                    Err(e) => {
                        // Body read error
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Error;
                        progress.final_response = Some(Response {
                            status,
                            headers,
                            body: Err(format!("Body read error: {e}")),
                        });
                    }
                }
            }
        }
        Err(e) => {
            // Request error (connection failed, etc.)
            let mut progress = progress_info.write().unwrap();
            progress.status = RequestStatus::Error;
            progress.final_response = Some(Response {
                status: reqwest::StatusCode::BAD_REQUEST, // Default status code for errors
                headers: reqwest::header::HeaderMap::new(),
                body: Err(format!("Request error: {e}")),
            });
        }
    }
}
