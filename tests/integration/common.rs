use reqwest_dll::*;
use std::time::Duration;

#[allow(dead_code)]
pub mod constants {
    // TLS Version constants
    pub const TLS_VERSION_1_2: u8 = 1;
    pub const TLS_VERSION_1_3: u8 = 2;

    // HTTP method constants for tests - must match the values in the DLL
    pub const HTTP_METHOD_GET: u8 = 1;
    pub const HTTP_METHOD_POST: u8 = 2;
    pub const HTTP_METHOD_PUT: u8 = 3;
    pub const HTTP_METHOD_DELETE: u8 = 4;
    pub const HTTP_METHOD_HEAD: u8 = 5;
    pub const HTTP_METHOD_OPTIONS: u8 = 6;
    pub const HTTP_METHOD_CONNECT: u8 = 7;
    pub const HTTP_METHOD_PATCH: u8 = 8;
    pub const HTTP_METHOD_TRACE: u8 = 9;
}

// Helper function to wait for request completion with retry for 5xx errors
pub fn wait_for_request_with_retry(request_id: usize, max_retries: u64) -> (u16, Option<String>) {
    for attempt in 0..=max_retries {
        // Wait for the request to complete
        while !request_is_complete(request_id) {
            std::thread::sleep(Duration::from_millis(50));
        }

        // Check status code
        let status = request_read_response_status(request_id);

        // If it's a server error (5xx) and we have retries left, retry
        if status >= 500 && status < 600 && attempt < max_retries {
            println!(
                "Got {} error from httpbin.org, retrying (attempt {}/{})",
                status,
                attempt + 1,
                max_retries
            );

            // Get error message if available for debugging
            let mut error_len: u32 = 0;
            let error_ptr = request_read_error_message(request_id, &mut error_len);
            let error_msg = if !error_ptr.is_null() && error_len > 0 {
                let error_str = unsafe {
                    let error_slice =
                        std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
                    std::str::from_utf8(error_slice)
                        .unwrap_or("Invalid UTF-8 in error")
                        .to_string()
                };
                string_destroy(error_ptr);
                Some(error_str)
            } else {
                None
            };

            // Clean up the failed request
            request_destroy(request_id);

            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << attempt);
            std::thread::sleep(Duration::from_millis(backoff_ms));

            return (status, error_msg);
        } else {
            // Not a 5xx error or we're out of retries
            return (status, None);
        }
    }

    // This should never happen due to the loop structure, but for completeness
    (0, Some("Retry logic error".to_string()))
}
