use crate::types::{RequestProgress, RequestStatus, Response, ERROR_KIND_NONE, ERROR_KIND_TIMEOUT, ERROR_KIND_CONNECTION, ERROR_KIND_REDIRECT, ERROR_KIND_INVALID_STATUS, ERROR_KIND_BODY, ERROR_KIND_DECODE, ERROR_KIND_BUILDER, ERROR_KIND_REQUEST, ERROR_KIND_FILE_SYSTEM, ERROR_KIND_UNKNOWN};
use reqwest::Response as ReqwestResponse;
use std::{
    error::Error as StdError,
    fs::File,
    future::Future,
    io::Write,
    sync::{Arc, RwLock},
};

fn analyze_reqwest_error(e: &reqwest::Error) -> (u8, String, Option<String>, Option<String>) {
    let error_kind = if e.is_timeout() {
        ERROR_KIND_TIMEOUT
    } else if e.is_connect() {
        ERROR_KIND_CONNECTION
    } else if e.is_redirect() {
        ERROR_KIND_REDIRECT
    } else if e.is_status() {
        ERROR_KIND_INVALID_STATUS
    } else if e.is_body() {
        ERROR_KIND_BODY
    } else if e.is_decode() {
        ERROR_KIND_DECODE
    } else if e.is_builder() {
        ERROR_KIND_BUILDER
    } else if e.is_request() {
        ERROR_KIND_REQUEST
    } else {
        ERROR_KIND_UNKNOWN
    };

    let main_message = e.to_string();
    
    let url = e.url().map(|u| u.to_string());
    
    let source = e.source().map(|s| s.to_string());
    
    let detailed_message = if let Some(ref src) = source {
        format!("{}: {}", main_message, src)
    } else {
        main_message
    };

    (error_kind, detailed_message, url, source)
}

// Process a request and handle the response stream within an async context
pub async fn process_request(
    request_future: impl Future<Output = reqwest::Result<ReqwestResponse>>,
    progress_info: Arc<RwLock<RequestProgress>>,
    output_file_path: Option<String>,
) {
    match request_future.await {
        Ok(response) => {
            // Get the status code, version, and headers before consuming the response
            let status = response.status();
            let version = response.version();
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
                                            version,
                                            headers,
                                            body: Err(format!("File write error: {e}")),
                                            error_kind: ERROR_KIND_FILE_SYSTEM,
                                            error_url: None,
                                            error_source: Some(e.to_string()),
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
                                        version,
                                        headers,
                                        body: Err(format!("Network error: {e}")),
                                        error_kind: ERROR_KIND_CONNECTION,
                                        error_url: None,
                                        error_source: Some(e.to_string()),
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
                            version,
                            headers,
                            body: Ok(Vec::new()), // Empty body since it was streamed to file
                            error_kind: ERROR_KIND_NONE,
                            error_url: None,
                            error_source: None,
                        });
                    }
                    Err(e) => {
                        // File open error
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Error;
                        progress.final_response = Some(Response {
                            status,
                            version,
                            headers,
                            body: Err(format!("File open error: {e}")),
                            error_kind: ERROR_KIND_FILE_SYSTEM,
                            error_url: None,
                            error_source: Some(e.to_string()),
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
                            version,
                            headers,
                            body: Ok(bytes_vec),
                            error_kind: ERROR_KIND_NONE,
                            error_url: None,
                            error_source: None,
                        });
                    }
                    Err(e) => {
                        // Body read error
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Error;
                        progress.final_response = Some(Response {
                            status,
                            version,
                            headers,
                            body: Err(format!("Body read error: {e}")),
                            error_kind: ERROR_KIND_BODY,
                            error_url: None,
                            error_source: Some(e.to_string()),
                        });
                    }
                }
            }
        }
        Err(e) => {
            // Request error (connection failed, etc.)
            let (error_kind, error_message, error_url, error_source) = analyze_reqwest_error(&e);
            
            let mut progress = progress_info.write().unwrap();
            progress.status = RequestStatus::Error;
            progress.final_response = Some(Response {
                status: e.status().unwrap_or(reqwest::StatusCode::BAD_REQUEST),
                version: reqwest::Version::HTTP_11,       // Default to HTTP/1.1 for errors
                headers: reqwest::header::HeaderMap::new(),
                body: Err(error_message),
                error_kind,
                error_url,
                error_source,
            });
        }
    }
}
