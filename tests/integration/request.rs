use crate::integration::common::{constants::*, wait_for_request_with_retry};
use reqwest_dll::*;
use std::time::Duration;

#[test]
fn test_request_builder_with_json() {
    // Build a client directly
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = std::ffi::CString::new("https://httpbin.org/post").unwrap();

    // Create a POST request builder
    let request_builder_ptr =
        client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
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
            let builder_ptr =
                client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
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
            let builder_ptr =
                client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
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
            let builder_ptr =
                client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
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
    request_destroy(request_id);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}
