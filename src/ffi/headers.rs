use crate::types::HeaderMapWrapper;
use libc::c_char;
use reqwest::header::{HeaderName, HeaderValue};
use std::{
    ffi::CStr,
    ptr,
};

/// Create a new header map
#[unsafe(no_mangle)]
pub extern "C" fn headers_create() -> *mut HeaderMapWrapper {
    Box::into_raw(Box::new(HeaderMapWrapper(reqwest::header::HeaderMap::new())))
}

/// Destroy a header map
#[unsafe(no_mangle)]
pub extern "C" fn headers_destroy(map_ptr: *mut HeaderMapWrapper) {
    if map_ptr.is_null() {
        return;
    }
    unsafe {
        let _ = Box::from_raw(map_ptr);
    }
}

/// Get all headers as a multi-line string with "key: value" format
#[unsafe(no_mangle)]
pub extern "C" fn headers_get_all(
    map_ptr: *mut HeaderMapWrapper,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }
    let header_map = unsafe {
        if map_ptr.is_null() {
            *num_bytes = 0;
            return ptr::null_mut();
        }
        &(*map_ptr).0
    };
    let mut headers_vec: Vec<String> = Vec::new();

    for (key, value) in header_map.iter() {
        let value_str = String::from_utf8_lossy(value.as_bytes());
        headers_vec.push(format!("{}: {}", key.as_str(), &value_str));
    }

    let result_str = headers_vec.join("\n");
    let result_len = result_str.len();

    let c_str_ptr = unsafe { libc::malloc(result_len + 1) as *mut c_char };
    if c_str_ptr.is_null() {
        unsafe { *num_bytes = 0 };
        return ptr::null_mut();
    }

    unsafe {
        ptr::copy_nonoverlapping(result_str.as_ptr(), c_str_ptr as *mut u8, result_len);
        *(c_str_ptr.add(result_len)) = 0;
        *num_bytes = result_len as u32;
    }
    c_str_ptr
}

/// Add a header to the map
#[unsafe(no_mangle)]
pub extern "C" fn headers_add(
    map_ptr: *mut HeaderMapWrapper,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if map_ptr.is_null() || key.is_null() || value.is_null() {
        return false;
    }
    let header_map = unsafe { &mut (*map_ptr).0 };
    let key_str = unsafe { CStr::from_ptr(key).to_string_lossy().into_owned() };
    let value_str = unsafe { CStr::from_ptr(value).to_string_lossy().into_owned() };

    match HeaderName::from_bytes(key_str.as_bytes()) {
        Ok(header_name) => match HeaderValue::from_str(&value_str) {
            Ok(header_value) => {
                header_map.append(header_name, header_value);
                true
            }
            Err(_) => false,
        },
        Err(_) => false,
    }
} 