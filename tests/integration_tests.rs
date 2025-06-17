use reqwest_dll::*;
use std::time::Duration;

#[allow(dead_code)]
mod constants {
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
use constants::*;

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
            println!(
                "Got {} error from httpbin.org, retrying (attempt {}/{})",
                status,
                attempt + 1,
                max_retries
            );

            // Get error message if available for debugging
            let mut error_len: u32 = 0;
            let error_ptr = request_read_transport_error(request_id, &mut error_len);
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

#[test]
fn test_header_map() {
    let headers_ptr = headers_create();
    assert!(!headers_ptr.is_null());

    let key = std::ffi::CString::new("Content-Type").unwrap();
    let value = std::ffi::CString::new("application/json").unwrap();

    let success = headers_add(headers_ptr, key.as_ptr(), value.as_ptr());
    assert!(success);

    // This part is tricky as we can't easily inspect the map from the outside.
    // The main test will verify headers are sent correctly.
    // For now, we just ensure it doesn't crash.

    headers_destroy(headers_ptr);
}

#[test]
fn test_headers_get_all() {
    let headers_ptr = headers_create();
    assert!(!headers_ptr.is_null());

    let key1 = std::ffi::CString::new("Content-Type").unwrap();
    let value1 = std::ffi::CString::new("application/json").unwrap();
    assert!(headers_add(headers_ptr, key1.as_ptr(), value1.as_ptr()));

    let key2 = std::ffi::CString::new("X-Custom-Header").unwrap();
    let value2 = std::ffi::CString::new("my-value").unwrap();
    assert!(headers_add(headers_ptr, key2.as_ptr(), value2.as_ptr()));

    let mut num_bytes: u32 = 0;
    let headers_str_ptr = headers_get_all(headers_ptr, &mut num_bytes);
    assert!(!headers_str_ptr.is_null());
    assert!(num_bytes > 0);

    let headers_str = unsafe {
        let slice = std::slice::from_raw_parts(headers_str_ptr as *const u8, num_bytes as usize);
        std::str::from_utf8(slice).unwrap()
    };

    println!("Headers string: {}", headers_str);

    assert!(headers_str.contains("content-type: application/json"));
    assert!(headers_str.contains("x-custom-header: my-value"));
    assert_eq!(headers_str.len(), num_bytes as usize);

    // Check for multi-line format
    assert!(headers_str.contains('\n'));

    string_destroy(headers_str_ptr);
    headers_destroy(headers_ptr);
}

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

#[test]
fn test_request_builder_with_json() {
    // Build a client directly
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();

    // Create a POST request builder
    let request_builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
    assert!(!request_builder_ptr.is_null());

    // Add JSON body
    let json = std::ffi::CString::new(r#"{"key":"value","test":123}"#).unwrap();
    assert!(request_builder_json(request_builder_ptr, json.as_ptr()));

    // Send the request. On success, the builder is consumed.
    let mut request_id = request_builder_create_request_and_send(request_builder_ptr);
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
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));

            // Create a new request
            let request_builder_ptr =
                client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
            assert!(request_builder_json(request_builder_ptr, json.as_ptr()));
            let request_id_new = request_builder_create_request_and_send(request_builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }

    // Check status code
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

    // Print the body for debugging
    println!("Response body: {}", body_str);

    // httpbin.org/post echoes the JSON content in the "json" field
    assert!(body_str.contains("\"key\""));
    assert!(body_str.contains("\"value\""));
    assert!(body_str.contains("\"test\""));
    assert!(body_str.contains("123"));

    // Destroy
    string_destroy(body_ptr);
    request_builder_destroy(request_builder_ptr);
    request_destroy(request_id);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}

#[test]
fn test_request_builder_query_params() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/get").unwrap();

    // Create a GET request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Add query parameters
    let key = std::ffi::CString::new("param1").unwrap();
    let value = std::ffi::CString::new("test123").unwrap();
    assert!(request_builder_query(
        builder_ptr,
        key.as_ptr(),
        value.as_ptr()
    ));

    // Send the request. On success, the builder is consumed.
    let mut request_id = request_builder_create_request_and_send(builder_ptr);
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
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));

            // Create a new request
            let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
            assert!(request_builder_query(
                builder_ptr,
                key.as_ptr(),
                value.as_ptr()
            ));
            let request_id_new = request_builder_create_request_and_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }

    // Check status code
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

    // httpbin.org/get should reflect the query params
    assert!(body_str.contains("param1"));
    assert!(body_str.contains("test123"));

    // Destroy
    string_destroy(body_ptr);
    request_builder_destroy(builder_ptr);
    request_destroy(request_id);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}

#[test]
fn test_request_builder_auth() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing that requires auth
    let url = std::ffi::CString::new("https://httpbin.org/basic-auth/user/passwd").unwrap();

    // Create a GET request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Add basic auth
    let username = std::ffi::CString::new("user").unwrap();
    let password = std::ffi::CString::new("passwd").unwrap();
    assert!(request_builder_basic_auth(
        builder_ptr,
        username.as_ptr(),
        password.as_ptr()
    ));

    // Send the request. On success, the builder is consumed.
    let mut request_id = request_builder_create_request_and_send(builder_ptr);
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
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));

            // Create a new request
            let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
            assert!(request_builder_basic_auth(
                builder_ptr,
                username.as_ptr(),
                password.as_ptr()
            ));
            let request_id_new = request_builder_create_request_and_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }

    // Check status code - should be 200 if auth worked
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

    // Destroy
    string_destroy(body_ptr);
    request_builder_destroy(builder_ptr);
    request_destroy(request_id);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}

#[test]
fn test_request_builder_form_data() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();

    // Create a POST request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Add form data
    let key = std::ffi::CString::new("field1").unwrap();
    let value = std::ffi::CString::new("form-value").unwrap();
    assert!(request_builder_form(
        builder_ptr,
        key.as_ptr(),
        value.as_ptr()
    ));

    // Send the request. On success, the builder is consumed.
    let mut request_id = request_builder_create_request_and_send(builder_ptr);
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
            let backoff_ms = 100u64 * (1u64 << retry_count); // Using bit shift instead of pow
            std::thread::sleep(Duration::from_millis(backoff_ms));

            // Create a new request
            let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
            assert!(request_builder_form(
                builder_ptr,
                key.as_ptr(),
                value.as_ptr()
            ));
            let request_id_new = request_builder_create_request_and_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }

    // Check status code
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

    // httpbin.org/post echoes the form data in the "form" field
    assert!(body_str.contains("field1"));
    assert!(body_str.contains("form-value"));

    // Destroy
    string_destroy(body_ptr);
    request_builder_destroy(builder_ptr);
    request_destroy(request_id);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}

#[test]
fn test_retry_mechanism() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for a non-existent endpoint that will return 404
    // This isn't a 5xx error, but we can verify the retry mechanism doesn't trigger
    let url = std::ffi::CString::new("https://httpbin.org/status/404").unwrap();

    // Create a GET request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Send the request. On success, the builder is consumed.
    let mut request_id = request_builder_create_request_and_send(builder_ptr);
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
            let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
            let request_id_new = request_builder_create_request_and_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }

    // This test should not have done any retries since it's a 404, not a 5xx
    assert_eq!(
        retry_count, 0,
        "No retries should have been performed for a 404 response"
    );
    assert_eq!(status, 404, "Status should be 404");

    // Now try with a 500 error endpoint
    let url_500 = std::ffi::CString::new("https://httpbin.org/status/500").unwrap();
    let builder_ptr_500 = client_create_request_builder(client_id, HTTP_METHOD_GET, url_500.as_ptr());
    assert!(!builder_ptr_500.is_null());

    // Send the request. On success, the builder is consumed.
    let mut request_id = request_builder_create_request_and_send(builder_ptr_500);
    assert!(request_id > 0);

    // Reset counters
    retry_count = 0;
    status = 0;

    while retry_count <= MAX_RETRIES {
        let (status_code, error_msg) = wait_for_request_with_retry(request_id, 0);
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
            let builder_ptr =
                client_create_request_builder(client_id, HTTP_METHOD_GET, url_500.as_ptr());
            let request_id_new = request_builder_create_request_and_send(builder_ptr);
            assert!(request_id_new > 0);
            request_id = request_id_new;
        } else {
            break;
        }
    }

    // This test should have done retries since it's a 500 error
    assert!(
        retry_count > 0,
        "Retries should have been performed for a 500 response"
    );
    assert_eq!(
        status, 500,
        "Final status should still be 500 after retries"
    );

    // Destroy
    request_builder_destroy(builder_ptr_500);
    request_destroy(request_id);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}

#[test]
fn test_client_builder_error_handling() {
    // Create a new client builder
    let client_builder_ptr = client_builder_create();
    assert!(!client_builder_ptr.is_null());

    // Intentionally create an invalid configuration by setting a User-Agent
    // with invalid characters. This is not allowed by the HTTP spec.
    // The `user_agent` method will store an error inside the builder.
    let invalid_user_agent = std::ffi::CString::new("My App \r\n Invalid").unwrap();
    assert!(client_builder_user_agent(
        client_builder_ptr,
        invalid_user_agent.as_ptr()
    ));

    // Now attempt to build the client - it should fail and return 0
    let client_id = client_builder_create_client_and_start(client_builder_ptr);

    // The build should have failed, so the client id must be 0.
    assert!(
        client_id == 0,
        "Client build should fail with an invalid User-Agent, but it succeeded."
    );

    // Check if we can retrieve the error message from the builder
    let mut error_len: u32 = 0;
    let error_ptr = client_builder_read_error_message(client_builder_ptr, &mut error_len);

    // We should have an error message
    assert!(
        !error_ptr.is_null(),
        "client_builder_read_error_message should return an error message, but it was null."
    );
    assert!(error_len > 0, "Error message should have a non-zero length.");

    // Convert the error message to a string
    let error_str = unsafe {
        let error_slice = std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
        std::str::from_utf8(error_slice)
            .unwrap_or("Invalid UTF-8 in error")
            .to_string()
    };

    // Destroy the error message memory
    string_destroy(error_ptr);

    // The error should contain the expected message about the invalid header value
    let expected_error_part = "builder error";
    assert!(
        error_str.contains(expected_error_part),
        "Error message did not contain '{}'. Got: {}",
        expected_error_part,
        error_str
    );

    println!(
        "Successfully tested error handling. Got expected error: {}",
        error_str
    );

    // IMPORTANT: The caller must now destroy the builder if the build fails.
    client_builder_destroy(client_builder_ptr);
}

#[test]
fn test_isolated_client_builder_errors() {
    // === Builder 1: Invalid Proxy URL ===
    let builder1_ptr = client_builder_create();
    assert!(!builder1_ptr.is_null());

    // Set an invalid proxy URL, which should fail immediately and set the error.
    let invalid_proxy = std::ffi::CString::new("!@#$%^&*").unwrap();
    let success1 = client_builder_https_proxy(builder1_ptr, invalid_proxy.as_ptr());
    assert!(
        !success1,
        "Setting an invalid proxy URL should return false."
    );

    // === Builder 2: Invalid User-Agent Header ===
    let builder2_ptr = client_builder_create();
    assert!(!builder2_ptr.is_null());

    // Set an invalid User-Agent. This doesn't fail immediately,
    // but causes the build to fail.
    let invalid_user_agent = std::ffi::CString::new("My App \r\n Invalid").unwrap();
    client_builder_user_agent(builder2_ptr, invalid_user_agent.as_ptr());

    // Attempt to build the client, which should fail.
    let client2_id = client_builder_create_client_and_start(builder2_ptr);
    assert_eq!(
        client2_id, 0,
        "Client build should fail with an invalid User-Agent."
    );

    // === Verify Error Messages are Isolated ===

    // -- Check Builder 1's error --
    let mut error1_len: u32 = 0;
    let error1_ptr = client_builder_read_error_message(builder1_ptr, &mut error1_len);
    assert!(
        !error1_ptr.is_null(),
        "Builder 1 should have an error message."
    );
    let error1_str = unsafe {
        let slice = std::slice::from_raw_parts(error1_ptr as *const u8, error1_len as usize);
        std::str::from_utf8(slice).unwrap().to_string()
    };
    string_destroy(error1_ptr);
    assert!(
        error1_str.contains("Invalid proxy URL"),
        "Builder 1's error message is incorrect. Got: {}",
        error1_str
    );

    // -- Check Builder 2's error --
    let mut error2_len: u32 = 0;
    let error2_ptr = client_builder_read_error_message(builder2_ptr, &mut error2_len);
    assert!(
        !error2_ptr.is_null(),
        "Builder 2 should have an error message."
    );
    let error2_str = unsafe {
        let slice = std::slice::from_raw_parts(error2_ptr as *const u8, error2_len as usize);
        std::str::from_utf8(slice).unwrap().to_string()
    };
    string_destroy(error2_ptr);
    assert!(
        error2_str.contains("Failed to build client"),
        "Builder 2's error message is incorrect. Got: {}",
        error2_str
    );

    // -- Final check: errors are different --
    assert_ne!(
        error1_str, error2_str,
        "Error messages for two different builders should not be the same."
    );

    println!("Builder 1 error: {}", error1_str);
    println!("Builder 2 error: {}", error2_str);

    // === Destroy ===
    client_builder_destroy(builder1_ptr);
    client_builder_destroy(builder2_ptr);
}

#[test]
fn test_isolated_request_builder_errors() {
    // Create a client to be used by the request builders
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();

    // === Builder 1: Invalid JSON Body ===
    let builder1_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
    assert!(!builder1_ptr.is_null());

    // Set a malformed JSON body
    let invalid_json = std::ffi::CString::new(r#"{"key": "value""#).unwrap(); // Missing closing brace
    let success1 = request_builder_json(builder1_ptr, invalid_json.as_ptr());
    assert!(
        !success1,
        "Setting invalid JSON should return false."
    );

    // Attempting to send this builder should fail immediately and return 0
    let request1_id = request_builder_create_request_and_send(builder1_ptr);
    assert_eq!(request1_id, 0, "Sending a builder with a config error should fail.");

    // === Builder 2: Invalid Header ===
    let builder2_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
    assert!(!builder2_ptr.is_null());

    // Set an invalid header key
    let invalid_header_key = std::ffi::CString::new("Bad Key\r\n").unwrap();
    let header_value = std::ffi::CString::new("value").unwrap();
    let success2 = request_builder_header(builder2_ptr, invalid_header_key.as_ptr(), header_value.as_ptr());
    assert!(
        !success2,
        "Setting an invalid header should return false."
    );
    
    // === Verify Error Messages are Isolated ===

    // -- Check Builder 1's error --
    let mut error1_len: u32 = 0;
    let error1_ptr = request_builder_read_error_message(builder1_ptr, &mut error1_len);
    assert!(
        !error1_ptr.is_null(),
        "Builder 1 should have an error message."
    );
    let error1_str = unsafe {
        let slice = std::slice::from_raw_parts(error1_ptr as *const u8, error1_len as usize);
        std::str::from_utf8(slice).unwrap().to_string()
    };
    string_destroy(error1_ptr);
    assert!(
        error1_str.contains("Invalid JSON format"),
        "Builder 1's error message is incorrect. Got: {}",
        error1_str
    );

    // -- Check Builder 2's error --
    let mut error2_len: u32 = 0;
    let error2_ptr = request_builder_read_error_message(builder2_ptr, &mut error2_len);
    assert!(
        !error2_ptr.is_null(),
        "Builder 2 should have an error message."
    );
    let error2_str = unsafe {
        let slice = std::slice::from_raw_parts(error2_ptr as *const u8, error2_len as usize);
        std::str::from_utf8(slice).unwrap().to_string()
    };
    string_destroy(error2_ptr);
    assert!(
        error2_str.contains("Invalid header name"),
        "Builder 2's error message is incorrect. Got: {}",
        error2_str
    );

    // -- Final check: errors are different --
    assert_ne!(
        error1_str, error2_str,
        "Error messages for two different request builders should not be the same."
    );

    println!("Request Builder 1 error: {}", error1_str);
    println!("Request Builder 2 error: {}", error2_str);

    // === Destroy ===
    request_builder_destroy(builder1_ptr);
    request_builder_destroy(builder2_ptr);
    client_destroy(client_id);
}
