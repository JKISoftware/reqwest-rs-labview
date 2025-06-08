use reqwest_dll::*;
use std::time::Duration;

#[test]
fn test_client_builder() {
    // Create a builder
    let builder_ptr = client_builder_new();
    assert!(!builder_ptr.is_null());

    // Build the client
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Close the client
    client_close(client_ptr);
}

#[test]
fn test_client_builder_configured() {
    // Create a builder
    let builder_ptr = client_builder_new();
    assert!(!builder_ptr.is_null());

    // Configure it
    assert!(client_builder_timeout(builder_ptr, 5, 10));
    assert!(client_builder_danger_accept_invalid_certs(builder_ptr, true));

    // Build the client
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Close the client
    client_close(client_ptr);
}

#[test]
fn test_header_map() {
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

#[test]
fn test_full_flow() {
    // Create default headers
    let default_headers = headers_new();
    let key1 = std::ffi::CString::new("X-Default").unwrap();
    let val1 = std::ffi::CString::new("true").unwrap();
    headers_add(default_headers, key1.as_ptr(), val1.as_ptr());

    // Create a builder and configure it
    let builder = client_builder_new();
    assert!(client_builder_timeout(builder, 5, 10));
    assert!(client_builder_danger_accept_invalid_certs(builder, true));
    assert!(client_builder_default_headers(builder, default_headers));

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
    let request_id = client_start_get_request(client, url.as_ptr(), request_headers, std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Check the status code
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);

    // Check for body content using request_read_response_body
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);

    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap()
    };
    assert!(body_str.contains("X-Default"));
    assert!(body_str.contains("X-Request"));

    // Free the string memory
    free_memory(body_ptr);

    // Clean up
    request_cleanup(request_id);
    headers_free(request_headers);
    headers_free(default_headers);
    client_close(client);
}

#[test]
fn test_request_post() {
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    let headers = headers_new();
    assert!(!headers.is_null());
    let key = std::ffi::CString::new("Content-Type").unwrap();
    let value = std::ffi::CString::new("application/json").unwrap();
    assert!(headers_add(headers, key.as_ptr(), value.as_ptr()));

    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();
    let json_body = std::ffi::CString::new(r#"{"key":"value"}"#).unwrap();
    let request_id =
        client_start_post_request(client, url.as_ptr(), json_body.as_ptr(), headers);
    assert!(request_id > 0);

    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    assert_eq!(request_read_response_status(request_id), 200);

    // Check for body content using request_read_response_body
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);

    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap()
    };
    assert!(body_str.contains("\"key\""));
    assert!(body_str.contains("\"value\""));
    assert!(body_str.contains("application/json"));

    // Free the string memory
    free_memory(body_ptr);

    request_cleanup(request_id);
    headers_free(headers);
    client_close(client);
}

#[test]
fn test_request_put() {
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    let headers = headers_new();
    assert!(!headers.is_null());
    let key = std::ffi::CString::new("Content-Type").unwrap();
    let value = std::ffi::CString::new("application/json").unwrap();
    assert!(headers_add(headers, key.as_ptr(), value.as_ptr()));

    let url = std::ffi::CString::new("https://httpbin.org/put").unwrap();
    let json_body = std::ffi::CString::new(r#"{"key":"put_test"}"#).unwrap();
    let request_id =
        client_start_put_request(client, url.as_ptr(), json_body.as_ptr(), headers);
    assert!(request_id > 0);

    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    assert_eq!(request_read_response_status(request_id), 200);

    // Check for body content using request_read_response_body
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);

    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap()
    };
    assert!(body_str.contains("\"put_test\""));
    assert!(body_str.contains("application/json"));

    // Free the string memory
    free_memory(body_ptr);

    request_cleanup(request_id);
    headers_free(headers);
    client_close(client);
}

#[test]
fn test_request_delete() {
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    let url = std::ffi::CString::new("https://httpbin.org/delete").unwrap();
    let request_id = client_start_delete_request(
        client,
        url.as_ptr(),
        std::ptr::null(),
        std::ptr::null_mut(),
    );
    assert!(request_id > 0);

    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Use request_read_response_status instead of async_take_result + response_status
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);

    request_cleanup(request_id);
    client_close(client);
}

#[test]
fn test_response_string_functions() {
    // Create a client and make a request
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    // Test successful response with request_read_response_body
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();
    let request_id = client_start_get_request(client, url.as_ptr(), std::ptr::null_mut(), std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Test getting the status directly
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);

    // Test request_read_response_body
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);

    // Convert body to a Rust string and verify content
    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap()
    };
    assert!(body_str.contains("httpbin.org"));

    // Free the string memory
    free_memory(body_ptr);

    // Test no error on successful request
    assert!(!request_has_response_error(request_id));
    let mut error_len: u32 = 0;
    let error_ptr = request_read_response_error_string(request_id, &mut error_len);
    assert!(error_ptr.is_null());
    assert_eq!(error_len, 0);

    // Clean up
    request_cleanup(request_id);

    // Test error response with request_read_response_error_string
    let invalid_url = std::ffi::CString::new("https://nonexistent.example.com/").unwrap();
    let request_id = client_start_get_request(client, invalid_url.as_ptr(), std::ptr::null_mut(), std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Test that it has an error
    assert!(request_has_response_error(request_id));

    // Test request_read_response_error_string
    let mut error_len: u32 = 0;
    let error_ptr = request_read_response_error_string(request_id, &mut error_len);
    assert!(!error_ptr.is_null());
    assert!(error_len > 0);

    // Convert error to a Rust string
    let error_str = unsafe {
        let error_slice = std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
        std::str::from_utf8(error_slice).unwrap()
    };
    assert!(error_str.contains("error") || error_str.contains("fail") || error_str.contains("Error"));

    // Free the string memory
    free_memory(error_ptr);

    // Test no body on error response
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(body_ptr.is_null());
    assert_eq!(body_len, 0);

    // Clean up
    request_cleanup(request_id);
    client_close(client);
}

#[test]
fn test_response_string_from_request_functions() {
    // Create a client and make a request
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    // Test successful response with request_read_response_body
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();
    let request_id = client_start_get_request(client, url.as_ptr(), std::ptr::null_mut(), std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Get the body directly
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);

    // Convert body to a Rust string and verify content
    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap()
    };
    assert!(body_str.contains("httpbin.org"));

    // Free the string memory
    free_memory(body_ptr);

    // No need to call response_free since request_read_response_body does that for us
    request_cleanup(request_id);

    // Test error response with request_read_response_error
    let invalid_url = std::ffi::CString::new("https://nonexistent.example.com/").unwrap();
    let request_id = client_start_get_request(client, invalid_url.as_ptr(), std::ptr::null_mut(), std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Get the error directly
    let mut error_len: u32 = 0;
    let error_ptr = request_read_response_error(request_id, &mut error_len);
    assert!(!error_ptr.is_null());
    assert!(error_len > 0);

    // Convert error to a Rust string
    let error_str = unsafe {
        let error_slice = std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
        std::str::from_utf8(error_slice).unwrap()
    };
    assert!(error_str.contains("error") || error_str.contains("fail") || error_str.contains("Error"));

    // Free the string memory
    free_memory(error_ptr);

    // No need to call response_free since request_read_response_error does that for us
    request_cleanup(request_id);
    client_close(client);
}

#[test]
fn test_request_api() {
    // Create a client
    let builder = client_builder_new();
    let client = client_builder_build(builder);
    assert!(!client.is_null());

    // Make a successful request
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();
    let request_id = client_start_get_request(client, url.as_ptr(), std::ptr::null_mut(), std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Check the status directly
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);

    // Check that it doesn't have an error
    assert!(!request_has_response_error(request_id));

    // Get the headers
    let headers = request_read_response_headers(request_id);
    assert!(!headers.is_null());
    headers_free(headers);

    // Test getting the body as a string
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);
    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap()
    };
    assert!(body_str.contains("httpbin.org"));
    free_memory(body_ptr);

    // Clean up
    request_cleanup(request_id);

    // Test error handling with an invalid URL
    let invalid_url = std::ffi::CString::new("https://nonexistent.example.com/").unwrap();
    let request_id = client_start_get_request(client, invalid_url.as_ptr(), std::ptr::null_mut(), std::ptr::null_mut());
    assert!(request_id > 0);

    // Wait for it to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Check that it has an error
    assert!(request_has_response_error(request_id));

    // Test getting the error as a string
    let mut error_len: u32 = 0;
    let error_ptr = request_read_response_error_string(request_id, &mut error_len);
    assert!(!error_ptr.is_null());
    assert!(error_len > 0);
    let error_str = unsafe {
        let error_slice = std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
        std::str::from_utf8(error_slice).unwrap()
    };
    assert!(error_str.contains("error") || error_str.contains("fail") || error_str.contains("Error"));
    free_memory(error_ptr);

    // Clean up
    request_cleanup(request_id);
    client_close(client);
} 
