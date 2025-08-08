use reqwest_dll::*;

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
