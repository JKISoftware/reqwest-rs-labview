use reqwest_dll::*;
use crate::integration::common::constants::*;
use std::time::Duration;

#[test]
fn test_error_handling_invalid_url() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create an invalid URL
    let url = std::ffi::CString::new("not-a-valid-url").unwrap();

    // Create a GET request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Send the request. We expect this to fail.
    let request_id = request_builder_create_request_and_send(builder_ptr);
    assert!(request_id > 0);

    // Wait for the request to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // Check if we have a transport error
    assert!(request_has_transport_error(request_id));

    // Read the error message
    let mut error_len: u32 = 0;
    let error_ptr = request_read_transport_error(request_id, &mut error_len);
    assert!(!error_ptr.is_null());
    assert!(error_len > 0);

    let error_str = unsafe {
        let error_slice = std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
        std::str::from_utf8(error_slice).unwrap()
    };

    println!("Transport error: {}", error_str);
    assert!(error_str.contains("error"));

    // Cleanup
    string_destroy(error_ptr);
    request_destroy(request_id);
    client_destroy(client_id);
}

#[test]
fn test_error_handling_connection_timeout() {
    // Build a client with a very short timeout
    let client_builder_ptr = client_builder_create();
    assert!(!client_builder_ptr.is_null());

    // Set a very short connection timeout (1ms)
    assert!(client_builder_connect_timeout_ms(client_builder_ptr, 1));

    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Use a valid but slow-to-connect URL
    // This is a non-routable IP address that should cause a connection timeout
    let url = std::ffi::CString::new("http://10.255.255.1/").unwrap();

    // Create a GET request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Send the request. We expect this to time out.
    let request_id = request_builder_create_request_and_send(builder_ptr);
    assert!(request_id > 0);

    // Wait for the request to complete (with a reasonable timeout)
    let start = std::time::Instant::now();
    while !request_is_complete(request_id) {
        if start.elapsed() > Duration::from_secs(5) {
            panic!("Request did not complete within 5 seconds");
        }
        std::thread::sleep(Duration::from_millis(50));
    }

    // Check if we have a transport error
    assert!(request_has_transport_error(request_id));

    // Read the error message
    let mut error_len: u32 = 0;
    let error_ptr = request_read_transport_error(request_id, &mut error_len);
    assert!(!error_ptr.is_null());
    assert!(error_len > 0);

    let error_str = unsafe {
        let error_slice = std::slice::from_raw_parts(error_ptr as *const u8, error_len as usize);
        std::str::from_utf8(error_slice).unwrap()
    };

    println!("Transport error: {}", error_str);
    // The error message might vary depending on the platform and reqwest version
    // Just ensure we have some kind of error message
    assert!(!error_str.is_empty(), "Expected a non-empty error message");

    // Cleanup
    string_destroy(error_ptr);
    request_destroy(request_id);
    client_destroy(client_id);
}

#[test]
fn test_error_handling_404_not_found() {
    // Build a client
    let client_builder_ptr = client_builder_create();
    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0);

    // Create a URL that should return 404
    let url = std::ffi::CString::new("https://httpbin.org/status/404").unwrap();

    // Create a GET request builder
    let builder_ptr = client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!builder_ptr.is_null());

    // Send the request
    let request_id = request_builder_create_request_and_send(builder_ptr);
    assert!(request_id > 0);

    // Wait for the request to complete
    while !request_is_complete(request_id) {
        std::thread::sleep(Duration::from_millis(50));
    }

    // For HTTP errors like 404, we don't expect a transport error
    assert!(!request_has_transport_error(request_id));

    // But we do expect a 404 status code
    let status = request_read_response_status(request_id);
    assert_eq!(status, 404);

    // Cleanup
    request_destroy(request_id);
    client_destroy(client_id);
} 