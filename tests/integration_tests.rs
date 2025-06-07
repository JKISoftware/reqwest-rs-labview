use reqwest_dll::*;
use std::time::Duration;

#[tokio::test]
async fn test_client_builder() {
    // Create a builder
    let builder_ptr = client_builder_new();
    assert!(!builder_ptr.is_null());

    // Build the client
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Close the client
    client_close(client_ptr);
}

#[tokio::test]
async fn test_client_builder_configured() {
    // Create a builder
    let builder_ptr = client_builder_new();
    assert!(!builder_ptr.is_null());

    // Configure it
    client_builder_timeout(builder_ptr, 5, 10);
    client_builder_danger_accept_invalid_certs(builder_ptr, true);

    // Build the client
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Close the client
    client_close(client_ptr);
}

#[tokio::test]
async fn test_header_map() {
    let headers_ptr = headers_new();
    assert!(!headers_ptr.is_null());

    let key = std::ffi::CString::new("Content-Type").unwrap();
    let value = std::ffi::CString::new("application/json").unwrap();

    let success = headers_add(headers_ptr, key.as_ptr(), value.as_ptr());
    assert!(success);

    // This part is tricky as we can't easily inspect the map from the outside.
    // The main test will verify headers are sent correctly.
    // For now, we just ensure it doesn't crash.

    headers_free(headers_ptr);
}

#[tokio::test]
async fn test_full_flow() {
    // Create default headers
    let default_headers = headers_new();
    let key1 = std::ffi::CString::new("X-Default").unwrap();
    let val1 = std::ffi::CString::new("true").unwrap();
    headers_add(default_headers, key1.as_ptr(), val1.as_ptr());

    // Create a builder and configure it
    let builder = client_builder_new();
    client_builder_timeout(builder, 5, 10);
    client_builder_danger_accept_invalid_certs(builder, true);
    client_builder_default_headers(builder, default_headers);

    // Build the client
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    // Create per-request headers
    let request_headers = headers_new();
    let key2 = std::ffi::CString::new("X-Request").unwrap();
    let val2 = std::ffi::CString::new("true").unwrap();
    headers_add(request_headers, key2.as_ptr(), val2.as_ptr());

    // Start a request
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();
    let request_id = async_get_start(client, url.as_ptr(), request_headers, std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !async_is_complete(request_id) {
        tokio::time::sleep(Duration::from_millis(50)).await;
    }

    // Get the result
    let response_ptr = async_take_result(request_id);
    assert!(!response_ptr.is_null());

    // Check the status code
    let status = response_status(response_ptr);
    assert_eq!(status, 200);

    // Check for body content
    let mut body_buffer = [0u8; 4096];
    let bytes_copied =
        response_body_copy(response_ptr, body_buffer.as_mut_ptr(), body_buffer.len() as u32);
    assert!(bytes_copied > 0);

    let body_str = std::str::from_utf8(&body_buffer[..bytes_copied as usize]).unwrap();
    assert!(body_str.contains("X-Default"));
    assert!(body_str.contains("X-Request"));

    // Clean up
    response_free(response_ptr);
    async_cleanup(request_id);
    headers_free(request_headers);
    client_close(client);
}

#[tokio::test]
async fn test_async_post() {
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();
    let json_body = std::ffi::CString::new(r#"{"key":"value"}"#).unwrap();
    let request_id =
        async_post_json_start(client, url.as_ptr(), json_body.as_ptr(), std::ptr::null_mut());
    assert!(request_id > 0);

    while !async_is_complete(request_id) {
        tokio::time::sleep(Duration::from_millis(50)).await;
    }

    let response_ptr = async_take_result(request_id);
    assert!(!response_ptr.is_null());
    assert_eq!(response_status(response_ptr), 200);

    let mut body_buffer = [0u8; 4096];
    let bytes_copied =
        response_body_copy(response_ptr, body_buffer.as_mut_ptr(), body_buffer.len() as u32);
    assert!(bytes_copied > 0);
    let body_str = std::str::from_utf8(&body_buffer[..bytes_copied as usize]).unwrap();
    assert!(body_str.contains("\"key\""));
    assert!(body_str.contains("\"value\""));

    response_free(response_ptr);
    async_cleanup(request_id);
    client_close(client);
}

#[tokio::test]
async fn test_async_put() {
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    let url = std::ffi::CString::new("https://httpbin.org/put").unwrap();
    let json_body = std::ffi::CString::new(r#"{"key":"put_test"}"#).unwrap();
    let request_id =
        async_put_json_start(client, url.as_ptr(), json_body.as_ptr(), std::ptr::null_mut());
    assert!(request_id > 0);

    while !async_is_complete(request_id) {
        tokio::time::sleep(Duration::from_millis(50)).await;
    }

    let response_ptr = async_take_result(request_id);
    assert!(!response_ptr.is_null());
    assert_eq!(response_status(response_ptr), 200);

    let mut body_buffer = [0u8; 4096];
    let bytes_copied =
        response_body_copy(response_ptr, body_buffer.as_mut_ptr(), body_buffer.len() as u32);
    assert!(bytes_copied > 0);
    let body_str = std::str::from_utf8(&body_buffer[..bytes_copied as usize]).unwrap();
    assert!(body_str.contains("\"put_test\""));

    response_free(response_ptr);
    async_cleanup(request_id);
    client_close(client);
}

#[tokio::test]
async fn test_async_delete() {
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    let url = std::ffi::CString::new("https://httpbin.org/delete").unwrap();
    let request_id = async_delete_start(client, url.as_ptr(), std::ptr::null_mut());
    assert!(request_id > 0);

    while !async_is_complete(request_id) {
        tokio::time::sleep(Duration::from_millis(50)).await;
    }

    let response_ptr = async_take_result(request_id);
    assert!(!response_ptr.is_null());
    assert_eq!(response_status(response_ptr), 200);

    response_free(response_ptr);
    async_cleanup(request_id);
    client_close(client);
} 