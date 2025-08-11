use reqwest_dll::*;
use std::ffi::CString;
use std::time::Duration;

use super::common::{constants::HTTP_METHOD_POST, wait_for_request_with_retry};

#[test]
fn test_multipart_form_create_destroy() {
    // Create a multipart form
    let form_ptr = multipart_form_create();
    assert!(!form_ptr.is_null());

    // Destroy the form
    multipart_form_destroy(form_ptr);
}

#[test]
fn test_multipart_form_add_text() {
    // Create a multipart form
    let form_ptr = multipart_form_create();
    assert!(!form_ptr.is_null());

    // Add a text field
    let name = CString::new("field1").unwrap();
    let value = CString::new("value1").unwrap();
    assert!(multipart_form_add_text(
        form_ptr,
        name.as_ptr(),
        value.as_ptr()
    ));

    // Add another text field
    let name2 = CString::new("field2").unwrap();
    let value2 = CString::new("value2").unwrap();
    assert!(multipart_form_add_text(
        form_ptr,
        name2.as_ptr(),
        value2.as_ptr()
    ));

    // Destroy the form
    multipart_form_destroy(form_ptr);
}

#[test]
fn test_multipart_form_with_request() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = CString::new("https://httpbin.org/post").unwrap();

    // Create a POST request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Create a multipart form
    let form_ptr = multipart_form_create();
    assert!(!form_ptr.is_null());

    // Add text fields to the form
    let name1 = CString::new("field1").unwrap();
    let value1 = CString::new("multipart-value1").unwrap();
    assert!(multipart_form_add_text(
        form_ptr,
        name1.as_ptr(),
        value1.as_ptr()
    ));

    let name2 = CString::new("field2").unwrap();
    let value2 = CString::new("multipart-value2").unwrap();
    assert!(multipart_form_add_text(
        form_ptr,
        name2.as_ptr(),
        value2.as_ptr()
    ));

    // Attach the multipart form to the request builder
    assert!(request_builder_multipart(builder_ptr, form_ptr));

    // Send the request
    let mut request_id = request_builder_create_request_and_send(builder_ptr);
    assert!(request_id > 0);

    // Use retry helper for resilience against httpbin.org issues
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

            // Wait before retrying with exponential backoff
            let backoff_ms = 100u64 * (1u64 << retry_count);
            std::thread::sleep(Duration::from_millis(backoff_ms));

            // Create a new request with new multipart form
            let builder_ptr =
                client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
            let form_ptr = multipart_form_create();
            assert!(multipart_form_add_text(
                form_ptr,
                name1.as_ptr(),
                value1.as_ptr()
            ));
            assert!(multipart_form_add_text(
                form_ptr,
                name2.as_ptr(),
                value2.as_ptr()
            ));
            assert!(request_builder_multipart(builder_ptr, form_ptr));
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

    // Clean up
    request_destroy(request_id);
    multipart_form_destroy(form_ptr); // Form should already be consumed, but call for safety
    request_builder_destroy(builder_ptr);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}

#[test]
fn test_multipart_form_with_file() {
    // Create a test file in a cross-platform temporary directory
    let temp_dir = std::env::temp_dir();
    let test_file_path = temp_dir.join("test_multipart_file.txt");
    let test_file_path_str = test_file_path.to_str().unwrap();
    std::fs::write(&test_file_path, b"This is test file content").unwrap();

    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = CString::new("https://httpbin.org/post").unwrap();

    // Create a POST request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Create a multipart form
    let form_ptr = multipart_form_create();
    assert!(!form_ptr.is_null());

    // Add a text field
    let name = CString::new("description").unwrap();
    let value = CString::new("Test file upload").unwrap();
    assert!(multipart_form_add_text(
        form_ptr,
        name.as_ptr(),
        value.as_ptr()
    ));

    // Add the file
    let file_field = CString::new("file").unwrap();
    let file_path_cstr = CString::new(test_file_path_str).unwrap();
    assert!(multipart_form_add_file(
        form_ptr,
        file_field.as_ptr(),
        file_path_cstr.as_ptr()
    ));

    // Attach the multipart form to the request builder
    assert!(request_builder_multipart(builder_ptr, form_ptr));

    // Send the request
    let request_id = request_builder_create_request_and_send(builder_ptr);
    assert!(request_id > 0);

    // Wait for completion with retry
    let (status, _) = wait_for_request_with_retry(request_id, 0);

    // httpbin.org should return 200 for successful POST
    if status >= 500 && status < 600 {
        println!(
            "Warning: httpbin.org returned {} (server error), test may be flaky",
            status
        );
    } else {
        assert_eq!(status, 200, "Expected status 200, got {}", status);
    }

    // Clean up
    request_destroy(request_id);
    multipart_form_destroy(form_ptr);
    request_builder_destroy(builder_ptr);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
    std::fs::remove_file(&test_file_path).ok();
}

#[test]
fn test_multipart_form_with_bytes() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL for testing
    let url = CString::new("https://httpbin.org/post").unwrap();

    // Create a POST request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Create a multipart form
    let form_ptr = multipart_form_create();
    assert!(!form_ptr.is_null());

    // Add binary data as a file part
    let field_name = CString::new("binary_file").unwrap();
    let data = b"Binary data content here";
    let filename = CString::new("data.bin").unwrap();
    let mime_type = CString::new("application/octet-stream").unwrap();

    assert!(multipart_form_add_bytes(
        form_ptr,
        field_name.as_ptr(),
        data.as_ptr(),
        data.len(),
        filename.as_ptr(),
        mime_type.as_ptr()
    ));

    // Attach the multipart form to the request builder
    assert!(request_builder_multipart(builder_ptr, form_ptr));

    // Send the request
    let request_id = request_builder_create_request_and_send(builder_ptr);
    assert!(request_id > 0);

    // Wait for completion
    let (status, _) = wait_for_request_with_retry(request_id, 0);

    // httpbin.org should return 200 for successful POST
    if status >= 500 && status < 600 {
        println!(
            "Warning: httpbin.org returned {} (server error), test may be flaky",
            status
        );
    } else {
        assert_eq!(status, 200, "Expected status 200, got {}", status);
    }

    // Clean up
    request_destroy(request_id);
    multipart_form_destroy(form_ptr);
    request_builder_destroy(builder_ptr);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}

#[test]
fn test_multipart_form_error_handling() {
    // Test invalid UTF-8 in field name
    let form_ptr = multipart_form_create();
    assert!(!form_ptr.is_null());

    // Create invalid UTF-8 sequence
    let invalid_utf8 = vec![0xFF, 0xFE, 0x00];
    let valid_value = CString::new("value").unwrap();

    // This should fail
    assert!(!multipart_form_add_text(
        form_ptr,
        invalid_utf8.as_ptr() as *const i8,
        valid_value.as_ptr()
    ));

    // Check error message
    let mut num_bytes = 0;
    let error_msg = multipart_form_read_error_message(form_ptr, &mut num_bytes);
    assert!(!error_msg.is_null());
    assert!(num_bytes > 0);

    // Clean up error message
    string_destroy(error_msg);

    // Clean up form
    multipart_form_destroy(form_ptr);
}

#[test]
fn test_multipart_form_consumed_error() {
    // Create a form and consume it
    let form_ptr = multipart_form_create();
    let name = CString::new("field").unwrap();
    let value = CString::new("value").unwrap();
    assert!(multipart_form_add_text(
        form_ptr,
        name.as_ptr(),
        value.as_ptr()
    ));

    // Create a request builder to consume the form
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    let url = CString::new("https://httpbin.org/post").unwrap();
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_POST, url.as_ptr());

    // Consume the form
    assert!(request_builder_multipart(builder_ptr, form_ptr));

    // Try to use the form again - should fail
    assert!(!multipart_form_add_text(
        form_ptr,
        name.as_ptr(),
        value.as_ptr()
    ));

    // Check for error message
    let mut num_bytes = 0;
    let error_msg = multipart_form_read_error_message(form_ptr, &mut num_bytes);
    assert!(!error_msg.is_null());
    assert!(num_bytes > 0);

    // Clean up
    string_destroy(error_msg);
    request_builder_destroy(builder_ptr);
    multipart_form_destroy(form_ptr);
    client_builder_destroy(client_builder_ptr);
    client_destroy(client_id);
}
