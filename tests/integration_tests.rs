use reqwest_dll::*;
use std::time::Duration;

// HTTP method constants for tests - must match the values in the DLL
const HTTP_METHOD_GET: u8 = 1;
const HTTP_METHOD_POST: u8 = 2;
const HTTP_METHOD_PUT: u8 = 3;
const HTTP_METHOD_DELETE: u8 = 4;
const HTTP_METHOD_HEAD: u8 = 5;
const HTTP_METHOD_OPTIONS: u8 = 6;
const HTTP_METHOD_CONNECT: u8 = 7;
const HTTP_METHOD_PATCH: u8 = 8;
const HTTP_METHOD_TRACE: u8 = 9;

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
fn test_request_builder_api() {
    // Build a client directly 
    let client_builder_ptr = client_builder_new();
    assert!(!client_builder_ptr.is_null());
    
    // Set client timeouts
    assert!(client_builder_timeout(client_builder_ptr, 5, 30));
    
    // Build the client
    let client_ptr = client_builder_build(client_builder_ptr);
    assert!(!client_ptr.is_null());

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();
    
    // Create a request builder with GET method
    let request_builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
    assert!(!request_builder_ptr.is_null());
    
    // Set a request-specific timeout (overrides client timeout)
    assert!(request_builder_timeout(request_builder_ptr, 15));
    
    // Add a header
    let key = std::ffi::CString::new("X-Test-Header").unwrap();
    let value = std::ffi::CString::new("test-value").unwrap();
    assert!(request_builder_header(request_builder_ptr, key.as_ptr(), value.as_ptr()));
    
    // Send the request
    let request_id = request_builder_send(request_builder_ptr);
    assert!(request_id > 0);
    
    // Wait for the request to complete - using the DLL's synchronous APIs
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }
    
    // Check status code
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);
    
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
    
    // Cleanup
    free_memory(body_ptr);
    request_cleanup(request_id);
    client_close(client_ptr);
}

#[test]
fn test_request_builder_with_json() {
    // Build a client directly 
    let client_builder_ptr = client_builder_new();
    let client_ptr = client_builder_build(client_builder_ptr);
    assert!(!client_ptr.is_null());

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();
    
    // Create a POST request builder
    let request_builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_POST, url.as_ptr());
    assert!(!request_builder_ptr.is_null());
    
    // Add JSON body
    let json = std::ffi::CString::new(r#"{"key":"value","test":123}"#).unwrap();
    assert!(request_builder_json(request_builder_ptr, json.as_ptr()));
    
    // Send the request
    let request_id = request_builder_send(request_builder_ptr);
    assert!(request_id > 0);
    
    // Wait for the request to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }
    
    // Check status code
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);
    
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
    
    // Print the body for debugging
    println!("Response body: {}", body_str);
    
    // httpbin.org/post echoes the JSON content in the "json" field
    assert!(body_str.contains("\"key\""));
    assert!(body_str.contains("\"value\""));
    assert!(body_str.contains("\"test\""));
    assert!(body_str.contains("123"));
    
    // Cleanup
    free_memory(body_ptr);
    request_cleanup(request_id);
    client_close(client_ptr);
}

#[test]
fn test_request_builder_query_params() {
    // Build a client 
    let builder_ptr = client_builder_new();
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();
    
    // Create a GET request builder
    let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());
    
    // Add query parameters
    let key = std::ffi::CString::new("param1").unwrap();
    let value = std::ffi::CString::new("test123").unwrap();
    assert!(request_builder_query(builder_ptr, key.as_ptr(), value.as_ptr()));
    
    // Send the request
    let request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Wait for the request to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }
    
    // Check status code
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);
    
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
    
    // httpbin.org/get should reflect the query params
    assert!(body_str.contains("param1"));
    assert!(body_str.contains("test123"));
    
    // Cleanup
    free_memory(body_ptr);
    request_cleanup(request_id);
    client_close(client_ptr);
}

#[test]
fn test_request_builder_auth() {
    // Build a client 
    let builder_ptr = client_builder_new();
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Create a URL for testing that requires auth
    let url = std::ffi::CString::new("https://httpbin.org/basic-auth/user/passwd").unwrap();
    
    // Create a GET request builder
    let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());
    
    // Add basic auth
    let username = std::ffi::CString::new("user").unwrap();
    let password = std::ffi::CString::new("passwd").unwrap();
    assert!(request_builder_basic_auth(builder_ptr, username.as_ptr(), password.as_ptr()));
    
    // Send the request
    let request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Wait for the request to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }
    
    // Check status code - should be 200 if auth worked
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);
    
    // Get the response body
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);
    
    // Cleanup
    free_memory(body_ptr);
    request_cleanup(request_id);
    client_close(client_ptr);
}

#[test]
fn test_request_builder_form_data() {
    // Build a client 
    let builder_ptr = client_builder_new();
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();
    
    // Create a POST request builder
    let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_POST, url.as_ptr());
    assert!(!builder_ptr.is_null());
    
    // Add form data
    let key = std::ffi::CString::new("field1").unwrap();
    let value = std::ffi::CString::new("form-value").unwrap();
    assert!(request_builder_form(builder_ptr, key.as_ptr(), value.as_ptr()));
    
    // Send the request
    let request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Wait for the request to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }
    
    // Check status code
    let status = request_read_response_status(request_id);
    assert_eq!(status, 200);
    
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
    
    // httpbin.org/post echoes the form data in the "form" field
    assert!(body_str.contains("field1"));
    assert!(body_str.contains("form-value"));
    
    // Cleanup
    free_memory(body_ptr);
    request_cleanup(request_id);
    client_close(client_ptr);
} 
