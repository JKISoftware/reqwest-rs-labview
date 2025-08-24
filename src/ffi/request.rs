use crate::{
    globals::{CLIENT_REQUESTS, REQUEST_TRACKER},
    types::{HeaderMapWrapper, RequestId, RequestStatus},
};
use libc::c_char;
use std::ptr;

/// Check if a request is complete
#[unsafe(no_mangle)]
pub extern "C" fn request_is_complete(request_id: RequestId) -> bool {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        match progress.status {
            RequestStatus::Completed | RequestStatus::Error | RequestStatus::Cancelled => true,
            RequestStatus::InProgress => false,
        }
    } else {
        true
    }
}

/// Get the progress percentage of a request
#[unsafe(no_mangle)]
pub extern "C" fn request_read_progress(request_id: RequestId) -> i32 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();

        if let Some(total) = progress.total_bytes
            && total > 0
        {
            return ((progress.received_bytes as f64 / total as f64) * 100.0) as i32;
        }

        match progress.status {
            RequestStatus::Completed => 100,
            RequestStatus::Error | RequestStatus::Cancelled => -1,
            RequestStatus::InProgress => 0,
        }
    } else {
        -1
    }
}

/// Get the total bytes of a request
#[unsafe(no_mangle)]
pub extern "C" fn request_read_total_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.total_bytes.unwrap_or(0)
    } else {
        0
    }
}

/// Get the received bytes of a request
#[unsafe(no_mangle)]
pub extern "C" fn request_read_received_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.received_bytes
    } else {
        0
    }
}

/// Get the response body as a C string directly from a request ID
#[unsafe(no_mangle)]
pub extern "C" fn request_read_response_body(
    request_id: RequestId,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }

    // Get the response info directly from the tracker
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            // If there's an error in the response, return null
            let body = match &response.body {
                Ok(body_bytes) => body_bytes,
                Err(_) => {
                    unsafe { *num_bytes = 0 };
                    return ptr::null_mut();
                }
            };

            // Calculate size including null terminator
            let body_len = body.len();
            unsafe { *num_bytes = body_len as u32 };

            // Allocate memory for the string + null terminator
            let c_str_ptr = unsafe { libc::malloc(body_len + 1) as *mut c_char };
            if c_str_ptr.is_null() {
                return ptr::null_mut();
            }

            // Copy the bytes and add null terminator
            unsafe {
                std::ptr::copy_nonoverlapping(body.as_ptr(), c_str_ptr as *mut u8, body_len);
                *(c_str_ptr.add(body_len)) = 0;
            }

            return c_str_ptr;
        }
    }

    unsafe { *num_bytes = 0 };
    ptr::null_mut() // Return null if request not found or no response yet
}

/// Get the error message as a C string directly from a request ID
#[unsafe(no_mangle)]
pub extern "C" fn request_read_transport_error(
    request_id: RequestId,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }

    // Get the response info directly from the tracker
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            // If there's no error in the response, return null
            let error_str = match &response.body {
                Err(error_str) => error_str,
                Ok(_) => {
                    unsafe { *num_bytes = 0 };
                    return ptr::null_mut();
                }
            };

            // Calculate size including null terminator
            let str_len = error_str.len();
            unsafe { *num_bytes = str_len as u32 };

            // Allocate memory for the string + null terminator
            let c_str_ptr = unsafe { libc::malloc(str_len + 1) as *mut c_char };
            if c_str_ptr.is_null() {
                return ptr::null_mut();
            }

            // Copy the string and add null terminator
            unsafe {
                std::ptr::copy_nonoverlapping(error_str.as_ptr(), c_str_ptr as *mut u8, str_len);
                *(c_str_ptr.add(str_len)) = 0;
            }

            return c_str_ptr;
        }
    }

    unsafe { *num_bytes = 0 };
    ptr::null_mut() // Return null if request not found or no response yet
}

/// Cancel a request
#[unsafe(no_mangle)]
pub extern "C" fn request_cancel(request_id: RequestId) -> bool {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let mut progress = progress_info.write().unwrap();

        if progress.status == RequestStatus::InProgress {
            progress.status = RequestStatus::Cancelled;
            return true;
        }
    }
    false
}

/// Destroy a request
#[unsafe(no_mangle)]
pub extern "C" fn request_destroy(request_id: RequestId) {
    // Remove the request from the tracker
    let mut tracker = REQUEST_TRACKER.lock().unwrap();
    tracker.remove(&request_id);

    // Remove the request from any client that might have it
    let mut client_requests = CLIENT_REQUESTS.lock().unwrap();
    for (_, requests) in client_requests.iter_mut() {
        requests.remove(&request_id);
    }
}

/// Get the status code directly from a request ID
#[unsafe(no_mangle)]
pub extern "C" fn request_read_response_status(request_id: RequestId) -> u16 {
    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return response.status.as_u16();
        }
    }

    0 // Return 0 if request not found or no response yet
}

/// Get the response headers directly from a request ID
#[unsafe(no_mangle)]
pub extern "C" fn request_read_response_headers(request_id: RequestId) -> *mut HeaderMapWrapper {
    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return Box::into_raw(Box::new(HeaderMapWrapper(response.headers.clone())));
        }
    }

    ptr::null_mut() // Return null if request not found or no response yet
}

/// Check if a request has an error (which can then be read with request_read_transport_error)
#[unsafe(no_mangle)]
pub extern "C" fn request_has_transport_error(request_id: RequestId) -> bool {
    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return response.body.is_err();
        }
    }

    false // Return false if request not found or no response yet
}

/// Get the HTTP version as a string directly from a request ID
/// Returns a C string like "HTTP/1.1", "HTTP/2", etc. Caller must free the memory.
#[unsafe(no_mangle)]
pub extern "C" fn request_read_response_version(
    request_id: RequestId,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }

    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            let version_str = match response.version {
                reqwest::Version::HTTP_09 => "HTTP/0.9",
                reqwest::Version::HTTP_10 => "HTTP/1.0",
                reqwest::Version::HTTP_11 => "HTTP/1.1",
                reqwest::Version::HTTP_2 => "HTTP/2",
                reqwest::Version::HTTP_3 => "HTTP/3",
                _ => "HTTP/Unknown",
            };

            // Calculate size including null terminator
            let str_len = version_str.len();
            unsafe { *num_bytes = str_len as u32 };

            // Allocate memory for the string + null terminator
            let c_str_ptr = unsafe { libc::malloc(str_len + 1) as *mut c_char };
            if c_str_ptr.is_null() {
                return ptr::null_mut();
            }

            // Copy the string and add null terminator
            unsafe {
                std::ptr::copy_nonoverlapping(version_str.as_ptr(), c_str_ptr as *mut u8, str_len);
                *(c_str_ptr.add(str_len)) = 0;
            }

            return c_str_ptr;
        }
    }

    unsafe { *num_bytes = 0 };
    ptr::null_mut() // Return null if request not found or no response yet
}

/// Get the error kind from a response
#[unsafe(no_mangle)]
pub extern "C" fn request_get_error_kind(request_id: RequestId) -> u8 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return response.error_kind;
        }
    }

    crate::types::ERROR_KIND_NONE
}

/// Get the error message with detailed information
#[unsafe(no_mangle)]
pub extern "C" fn request_get_error_message(
    request_id: RequestId,
    buffer: *mut c_char,
    buffer_len: usize,
) -> usize {
    if buffer.is_null() || buffer_len == 0 {
        return 0;
    }

    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            if let Err(ref error_msg) = response.body {
                let msg_len = error_msg.len().min(buffer_len - 1);
                unsafe {
                    std::ptr::copy_nonoverlapping(error_msg.as_ptr(), buffer as *mut u8, msg_len);
                    *buffer.add(msg_len) = 0;
                }
                return msg_len;
            }
        }
    }

    0
}

/// Get the error URL if available
#[unsafe(no_mangle)]
pub extern "C" fn request_get_error_url(
    request_id: RequestId,
    buffer: *mut c_char,
    buffer_len: usize,
) -> usize {
    if buffer.is_null() || buffer_len == 0 {
        return 0;
    }

    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            if let Some(ref url) = response.error_url {
                let url_len = url.len().min(buffer_len - 1);
                unsafe {
                    std::ptr::copy_nonoverlapping(url.as_ptr(), buffer as *mut u8, url_len);
                    *buffer.add(url_len) = 0;
                }
                return url_len;
            }
        }
    }

    0
}

/// Get the root cause error message
#[unsafe(no_mangle)]
pub extern "C" fn request_get_error_source(
    request_id: RequestId,
    buffer: *mut c_char,
    buffer_len: usize,
) -> usize {
    if buffer.is_null() || buffer_len == 0 {
        return 0;
    }

    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            if let Some(ref source) = response.error_source {
                let src_len = source.len().min(buffer_len - 1);
                unsafe {
                    std::ptr::copy_nonoverlapping(source.as_ptr(), buffer as *mut u8, src_len);
                    *buffer.add(src_len) = 0;
                }
                return src_len;
            }
        }
    }

    0
}

/// Check if response has an error
#[unsafe(no_mangle)]
pub extern "C" fn request_response_has_error(request_id: RequestId) -> bool {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return response.body.is_err() || response.error_kind != crate::types::ERROR_KIND_NONE;
        }
    }

    false
}
