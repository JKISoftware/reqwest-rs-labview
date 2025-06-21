use reqwest_dll::*;
use crate::integration::common::{constants::*, wait_for_request_with_retry};
use std::time::Duration;

#[test]
fn test_request_builder_api() {
    // Build a client directly
    let client_builder_ptr = client_builder_create();
    assert!(!client_builder_ptr.is_null());

    // Set client timeouts
    assert!(client_builder_connect_timeout_ms(client_builder_ptr, 5000));
    assert!(client_builder_timeout_ms(client_builder_ptr, 15000));

    // Build the client
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();

    // Create a request builder with GET method
    let request_builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!request_builder_ptr.is_null());

    // Set a request-specific timeout (overrides client timeout)
    assert!(request_builder_timeout_ms(request_builder_ptr, 15000));

    // Add a header
    let key = std::ffi::CString::new("X-Test-Header").unwrap();
    let value = std::ffi::CString::new("test-value").unwrap();
    assert!(request_builder_header(
        request_builder_ptr,
        key.as_ptr(),
        value.as_ptr()
    ));

    // Send the request. On success, the builder is consumed.
    let mut request_id = request_builder_create_request_and_send(request_builder_ptr);
    assert!(request_id > 0);

    // Use our retry helper (max 3 retries)
    let mut status = 0;
    let mut retry_count = 0;
    const MAX_RETRIES: u32 = 3;

    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0); // 0 because we're handling retries manually here
        status = status_code;

        if status >= 500 && status < 600 && retry_count < MAX_RETRIES {
            retry_count += 1;
            println!(
                "Got {} error from httpbin.org, retrying (attempt {}/{})",
                status, retry_count, MAX_RETRIES
            );
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }

            // Clean up the failed request
            request_destroy(request_id);

            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count);
            std::thread::sleep(Duration::from_millis(backoff_ms));

            // Create a new request
            let request_builder_ptr =
                client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
            assert!(request_builder_timeout_ms(request_builder_ptr, 15000));
            assert!(request_builder_header(
                request_builder_ptr,
                key.as_ptr(),
                value.as_ptr()
            ));
            let request_id_new = request_builder_create_request_and_send(request_builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }

    // Now check the status code
    assert_eq!(
        status, 200,
        "httpbin.org returned status {} after {} retries",
        status, retry_count
    );

    // Get the response body
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);

    // Validate the response content
    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap()
    };

    // httpbin.org/get reflects headers in the response, so we should see our custom header
    assert!(body_str.contains("X-Test-Header"));
    assert!(body_str.contains("test-value"));

    // Destroy
    string_destroy(body_ptr);
    request_destroy(request_id);
    client_destroy(client_id);
} 