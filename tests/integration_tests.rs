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

// Helper function to wait for request completion with retry for 5xx errors
fn wait_for_request_with_retry(request_id: u64, max_retries: u32) -> (u16, Option<String>) {
    for attempt in 0..=max_retries {
        // Wait for the request to complete
        while !request_is_complete(request_id) {
            std::thread::sleep(Duration::from_millis(50));
        }
        
        // Check status code
        let status = request_read_response_status(request_id);
        
        // If it's a server error (5xx) and we have retries left, retry
        if status >= 500 && status < 600 && attempt < max_retries {
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, attempt + 1, max_retries);
            
            // Get error message if available for debugging
            let mut error_len: u32 = 0;
            let error_ptr = request_read_response_error(request_id, &mut error_len);
            let error_msg = if !error_ptr.is_null() && error_len > 0 {
                let error_str = unsafe {
                    let error_slice = std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
                    std::str::from_utf8(error_slice).unwrap_or("Invalid UTF-8 in error").to_string()
                };
                free_memory(error_ptr);
                Some(error_str)
            } else {
                None
            };
            
            // Clean up the failed request
            request_cleanup(request_id);
            
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
    let mut request_id = request_builder_send(request_builder_ptr);
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
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, retry_count, MAX_RETRIES);
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }
            
            // Clean up the failed request
            request_cleanup(request_id);
            
            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count);
            std::thread::sleep(Duration::from_millis(backoff_ms));
            
            // Create a new request
            let request_builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
            assert!(request_builder_timeout(request_builder_ptr, 15));
            assert!(request_builder_header(request_builder_ptr, key.as_ptr(), value.as_ptr()));
            let request_id_new = request_builder_send(request_builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }
    
    // Now check the status code
    assert_eq!(status, 200, "httpbin.org returned status {} after {} retries", status, retry_count);
    
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
    let mut request_id = request_builder_send(request_builder_ptr);
    assert!(request_id > 0);
    
    // Use our retry helper (max 3 retries)
    let mut status = 0;
    let mut retry_count = 0;
    const MAX_RETRIES: u32 = 3;
    
    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0);
        status = status_code;
        
        if status >= 500 && status < 600 && retry_count < MAX_RETRIES {
            retry_count += 1;
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, retry_count, MAX_RETRIES);
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }
            
            // Clean up the failed request
            request_cleanup(request_id);
            
            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));
            
            // Create a new request
            let request_builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_POST, url.as_ptr());
            assert!(request_builder_json(request_builder_ptr, json.as_ptr()));
            let request_id_new = request_builder_send(request_builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }
    
    // Check status code
    assert_eq!(status, 200, "httpbin.org returned status {} after {} retries", status, retry_count);
    
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
    let mut request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Use our retry helper (max 3 retries)
    let mut status = 0;
    let mut retry_count = 0;
    const MAX_RETRIES: u32 = 3;
    
    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0);
        status = status_code;
        
        if status >= 500 && status < 600 && retry_count < MAX_RETRIES {
            retry_count += 1;
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, retry_count, MAX_RETRIES);
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }
            
            // Clean up the failed request
            request_cleanup(request_id);
            
            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));
            
            // Create a new request
            let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
            assert!(request_builder_query(builder_ptr, key.as_ptr(), value.as_ptr()));
            let request_id_new = request_builder_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }
    
    // Check status code
    assert_eq!(status, 200, "httpbin.org returned status {} after {} retries", status, retry_count);
    
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
    let mut request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Use our retry helper (max 3 retries)
    let mut status = 0;
    let mut retry_count = 0;
    const MAX_RETRIES: u32 = 3;
    
    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0);
        status = status_code;
        
        if status >= 500 && status < 600 && retry_count < MAX_RETRIES {
            retry_count += 1;
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, retry_count, MAX_RETRIES);
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }
            
            // Clean up the failed request
            request_cleanup(request_id);
            
            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));
            
            // Create a new request
            let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
            assert!(request_builder_basic_auth(builder_ptr, username.as_ptr(), password.as_ptr()));
            let request_id_new = request_builder_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }
    
    // Check status code - should be 200 if auth worked
    assert_eq!(status, 200, "httpbin.org returned status {} after {} retries", status, retry_count);
    
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
    let mut request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Use our retry helper (max 3 retries)
    let mut status = 0;
    let mut retry_count = 0;
    const MAX_RETRIES: u32 = 3;
    
    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0);
        status = status_code;
        
        if status >= 500 && status < 600 && retry_count < MAX_RETRIES {
            retry_count += 1;
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, retry_count, MAX_RETRIES);
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }
            
            // Clean up the failed request
            request_cleanup(request_id);
            
            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));
            
            // Create a new request
            let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_POST, url.as_ptr());
            assert!(request_builder_form(builder_ptr, key.as_ptr(), value.as_ptr()));
            let request_id_new = request_builder_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }
    
    // Check status code
    assert_eq!(status, 200, "httpbin.org returned status {} after {} retries", status, retry_count);
    
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

#[test]
fn test_retry_mechanism() {
    // Build a client 
    let builder_ptr = client_builder_new();
    let client_ptr = client_builder_build(builder_ptr);
    assert!(!client_ptr.is_null());

    // Create a URL for a non-existent endpoint that will return 404
    // This isn't a 5xx error, but we can verify the retry mechanism doesn't trigger
    let url = std::ffi::CString::new("https://httpbin.org/status/404").unwrap();
    
    // Create a GET request builder
    let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());
    
    // Send the request
    let mut request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Use our retry helper (max 3 retries)
    let mut status = 0;
    let mut retry_count = 0;
    const MAX_RETRIES: u32 = 3;
    
    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0);
        status = status_code;
        
        if status >= 500 && status < 600 && retry_count < MAX_RETRIES {
            retry_count += 1;
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, retry_count, MAX_RETRIES);
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }
            
            // Clean up the failed request
            request_cleanup(request_id);
            
            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count);
            std::thread::sleep(Duration::from_millis(backoff_ms));
            
            // Create a new request
            let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url.as_ptr());
            let request_id_new = request_builder_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }
    
    // This test should not have done any retries since it's a 404, not a 5xx
    assert_eq!(retry_count, 0, "No retries should have been performed for a 404 response");
    assert_eq!(status, 404, "Status should be 404");
    
    // Now try with a 500 error endpoint
    let url_500 = std::ffi::CString::new("https://httpbin.org/status/500").unwrap();
    let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url_500.as_ptr());
    assert!(!builder_ptr.is_null());
    
    // Send the request
    let mut request_id = request_builder_send(builder_ptr);
    assert!(request_id > 0);
    
    // Reset counters
    retry_count = 0;
    status = 0;
    
    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0);
        status = status_code;
        
        if status >= 500 && status < 600 && retry_count < MAX_RETRIES {
            retry_count += 1;
            println!("Got {} error from httpbin.org, retrying (attempt {}/{})", 
                     status, retry_count, MAX_RETRIES);
            if let Some(err) = error_msg {
                println!("Error details: {}", err);
            }
            
            // Clean up the failed request
            request_cleanup(request_id);
            
            // Wait a bit before retrying (with exponential backoff)
            let backoff_ms = 100u64 * (1u64 << retry_count);
            std::thread::sleep(Duration::from_millis(backoff_ms));
            
            // Create a new request
            let builder_ptr = client_new_request_builder(client_ptr, HTTP_METHOD_GET, url_500.as_ptr());
            let request_id_new = request_builder_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }
    
    // This test should have done retries since it's a 500 error
    assert!(retry_count > 0, "Retries should have been performed for a 500 response");
    assert_eq!(status, 500, "Final status should still be 500 after retries");
    
    // Cleanup
    request_cleanup(request_id);
    client_close(client_ptr);
} 
