use crate::{
    globals::{client_register_request, request_builder_create_request_id, GLOBAL_RUNTIME},
    types::{HeaderMapWrapper, RequestBuilderWrapper, RequestId, RequestStatus},
};
use libc::c_char;
use std::{ffi::CStr, ptr, sync::{Arc, RwLock}, time::Duration};

/// Destroy a request builder without sending
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_destroy(builder_ptr: *mut RequestBuilderWrapper) {
    if !builder_ptr.is_null() {
        unsafe {
            let _ = Box::from_raw(builder_ptr);
        }
    }
}

/// Set request timeout
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_timeout_ms(
    builder_ptr: *mut RequestBuilderWrapper,
    timeout_ms: u64,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }

    let builder = unsafe { &mut *builder_ptr };
    builder.with_builder(|b| b.timeout(Duration::from_millis(timeout_ms)))
}

/// Set request headers
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_headers(
    builder_ptr: *mut RequestBuilderWrapper,
    headers_ptr: *mut HeaderMapWrapper,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }

    let headers = if headers_ptr.is_null() {
        reqwest::header::HeaderMap::new()
    } else {
        unsafe { (*headers_ptr).0.clone() }
    };

    let builder = unsafe { &mut *builder_ptr };
    builder.with_builder(|b| b.headers(headers))
}

/// Set request body
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_body(
    builder_ptr: *mut RequestBuilderWrapper,
    body: *const c_char,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let builder_wrapper = unsafe { &mut *builder_ptr };

    let body_str = if !body.is_null() {
        match unsafe { CStr::from_ptr(body).to_str() } {
            Ok(s) => s,
            Err(_) => {
                builder_wrapper.error_message = Some("Body contains invalid UTF-8".to_string());
                return false;
            }
        }
    } else {
        ""
    };

    builder_wrapper.with_builder(|b| b.body(body_str.to_string()))
}

/// Set the output file path for the request, which will cause the response to be streamed to the file.
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_set_output_file(
    builder_ptr: *mut RequestBuilderWrapper,
    file_path: *const c_char,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    if file_path.is_null() {
        builder_wrapper.output_file_path = None;
        return true;
    }

    let file_path_str = match unsafe { CStr::from_ptr(file_path).to_str() } {
        Ok(s) => s,
        Err(_) => {
            builder_wrapper.error_message =
                Some("File path contains invalid UTF-8".to_string());
            return false;
        }
    };

    if file_path_str.is_empty() {
        builder_wrapper.output_file_path = None;
    } else {
        builder_wrapper.output_file_path = Some(file_path_str.to_string());
    }

    true
}

/// Send the request and get a request ID.
/// If an output file path is set on the builder, the response will be streamed to that file.
/// Otherwise, it will be buffered in memory.
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_create_request_and_send(
    builder_ptr: *mut RequestBuilderWrapper,
) -> RequestId {
    if builder_ptr.is_null() {
        return 0;
    }

    // First, borrow mutably to check for pre-existing errors.
    let builder_wrapper = unsafe { &mut *builder_ptr };
    if builder_wrapper.error_message.is_some() {
        // Do not consume the builder. The caller needs it to read the error.
        return 0;
    }

    // Now, attempt to take the internal builder.
    // `take()` is equivalent to `std::mem::replace(&mut self.builder, None)`.
    let request_builder = if let Some(b) = builder_wrapper.builder.take() {
        b
    } else {
        // The builder was already consumed. This is a usage error.
        // Set an error on the wrapper and return. Caller is responsible for destroying.
        builder_wrapper.error_message = Some("Request builder was already consumed.".to_string());
        return 0;
    };

    // The builder has been used to create the request, but the caller is still
    // responsible for destroying the wrapper.
    let client_id = builder_wrapper.client_id;
    let output_file_path = builder_wrapper.output_file_path.clone();

    // Create a new request ID
    let request_id = request_builder_create_request_id();

    // Create progress tracking
    let progress_info = Arc::new(RwLock::new(crate::types::RequestProgress {
        status: RequestStatus::InProgress,
        total_bytes: None,
        received_bytes: 0,
        final_response: None,
    }));

    // Store the progress info
    {
        let mut tracker = crate::globals::REQUEST_TRACKER.lock().unwrap();
        tracker.insert(request_id, progress_info.clone());
    }

    // Register this request with the client
    client_register_request(client_id, request_id);

    // Use the global runtime to process the request
    GLOBAL_RUNTIME.spawn(async move {
        // Get the future within the Tokio context
        let request_future = request_builder.send();
        crate::async_support::process_request(request_future, progress_info, output_file_path).await;
    });

    request_id
}

/// Add a header to the request
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_header(
    builder_ptr: *mut RequestBuilderWrapper,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if builder_ptr.is_null() || key.is_null() || value.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    let (key_str, value_str) = unsafe {
        let key_cstr = CStr::from_ptr(key);
        let value_cstr = CStr::from_ptr(value);
        (
            match key_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    builder_wrapper.error_message =
                        Some("Header key contains invalid UTF-8".to_string());
                    return false;
                }
            },
            match value_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    builder_wrapper.error_message =
                        Some("Header value contains invalid UTF-8".to_string());
                    return false;
                }
            },
        )
    };

    if key_str.is_empty() {
        builder_wrapper.error_message = Some("Header key cannot be empty.".to_string());
        return false;
    }

    let header_name = match reqwest::header::HeaderName::from_bytes(key_str.as_bytes()) {
        Ok(name) => name,
        Err(e) => {
            builder_wrapper.error_message = Some(format!("Invalid header name: {}", e));
            return false;
        }
    };

    let header_value = match reqwest::header::HeaderValue::from_str(value_str) {
        Ok(val) => val,
        Err(e) => {
            builder_wrapper.error_message = Some(format!("Invalid header value: {}", e));
            return false;
        }
    };

    builder_wrapper.with_builder(|b| b.header(header_name, header_value))
}

/// Set query parameters
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_query(
    builder_ptr: *mut RequestBuilderWrapper,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if builder_ptr.is_null() || key.is_null() || value.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    let (key_str, value_str) = unsafe {
        let key_cstr = CStr::from_ptr(key);
        let value_cstr = CStr::from_ptr(value);
        (
            match key_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    builder_wrapper.error_message =
                        Some("Query key contains invalid UTF-8".to_string());
                    return false;
                }
            },
            match value_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    builder_wrapper.error_message =
                        Some("Query value contains invalid UTF-8".to_string());
                    return false;
                }
            },
        )
    };

    if key_str.is_empty() {
        builder_wrapper.error_message = Some("Query key cannot be empty.".to_string());
        return false;
    }

    unsafe { &mut *builder_ptr }.with_builder(|b| {
        // Create a simple query param
        let query = [(key_str, value_str)];
        b.query(&query)
    })
}

/// Set basic authentication
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_basic_auth(
    builder_ptr: *mut RequestBuilderWrapper,
    username: *const c_char,
    password: *const c_char,
) -> bool {
    if builder_ptr.is_null() || username.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    let username_str = unsafe {
        match CStr::from_ptr(username).to_str() {
            Ok(s) => s,
            Err(_) => {
                builder_wrapper.error_message =
                    Some("Username contains invalid UTF-8".to_string());
                return false;
            }
        }
    };

    let password_str = if !password.is_null() {
        match unsafe { CStr::from_ptr(password).to_str() } {
            Ok(s) => Some(s),
            Err(_) => {
                builder_wrapper.error_message =
                    Some("Password contains invalid UTF-8".to_string());
                return false;
            }
        }
    } else {
        None
    };

    builder_wrapper.with_builder(|b| {
        if let Some(pwd) = password_str {
            b.basic_auth(username_str, Some(pwd))
        } else {
            b.basic_auth(username_str, Option::<&str>::None)
        }
    })
}

/// Set bearer authentication
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_bearer_auth(
    builder_ptr: *mut RequestBuilderWrapper,
    token: *const c_char,
) -> bool {
    if builder_ptr.is_null() || token.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    let token_str = unsafe {
        match CStr::from_ptr(token).to_str() {
            Ok(s) => s,
            Err(_) => {
                builder_wrapper.error_message = Some("Token contains invalid UTF-8".to_string());
                return false;
            }
        }
    };

    builder_wrapper.with_builder(|b| b.bearer_auth(token_str))
}

/// Set JSON body (convenience method that sets content-type header too)
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_json(
    builder_ptr: *mut RequestBuilderWrapper,
    json: *const c_char,
) -> bool {
    if builder_ptr.is_null() || json.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    let json_str = unsafe {
        match CStr::from_ptr(json).to_str() {
            Ok(s) => s,
            Err(_) => {
                builder_wrapper.error_message =
                    Some("JSON string contains invalid UTF-8".to_string());
                return false;
            }
        }
    };

    // Create a serde_json::Value from the JSON string
    let json_value = match serde_json::from_str::<serde_json::Value>(json_str) {
        Ok(v) => v,
        Err(e) => {
            builder_wrapper.error_message = Some(format!("Invalid JSON format: {}", e));
            return false;
        }
    };

    builder_wrapper.with_builder(|b| b.json(&json_value))
}

#[unsafe(no_mangle)]
pub extern "C" fn request_builder_body_binary(
    builder_ptr: *mut RequestBuilderWrapper,
    data: *const u8,
    data_len: usize,
) -> bool {
    if builder_ptr.is_null() || data.is_null() {
        return false;
    }
    
    let builder_wrapper = unsafe { &mut *builder_ptr };
    
    // Validate data length
    if data_len == 0 {
        builder_wrapper.error_message = Some("Binary data length cannot be zero".to_string());
        return false;
    }
    
    let binary_data = unsafe {
        std::slice::from_raw_parts(data, data_len).to_vec()
    };
    
    builder_wrapper.with_builder(|b| b.body(binary_data))
}

/// Set a form parameter
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_form(
    builder_ptr: *mut RequestBuilderWrapper,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if builder_ptr.is_null() || key.is_null() || value.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    let (key_str, value_str) = unsafe {
        let key_cstr = CStr::from_ptr(key);
        let value_cstr = CStr::from_ptr(value);
        (
            match key_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    builder_wrapper.error_message =
                        Some("Form key contains invalid UTF-8".to_string());
                    return false;
                }
            },
            match value_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    builder_wrapper.error_message =
                        Some("Form value contains invalid UTF-8".to_string());
                    return false;
                }
            },
        )
    };

    if key_str.is_empty() {
        builder_wrapper.error_message = Some("Form key cannot be empty.".to_string());
        return false;
    }

    builder_wrapper.with_builder(|b| {
        // Create a simple form param
        let form = [(key_str, value_str)];
        b.form(&form)
    })
}

/// Get the last error message from a RequestBuilder as a C string.
/// This function consumes the error message string, so the builder's
/// error state is cleared after the read.
#[unsafe(no_mangle)]
pub extern "C" fn request_builder_read_error_message(
    builder_ptr: *mut RequestBuilderWrapper,
    num_bytes: *mut u32,
) -> *mut c_char {
    if builder_ptr.is_null() || num_bytes.is_null() {
        if !num_bytes.is_null() {
            unsafe { *num_bytes = 0 };
        }
        return ptr::null_mut();
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    if let Some(error_message) = builder_wrapper.error_message.take() {
        let error_len = error_message.len();
        unsafe { *num_bytes = error_len as u32 };

        // Allocate memory for the string + null terminator
        let c_str_ptr = unsafe { libc::malloc(error_len + 1) as *mut c_char };
        if c_str_ptr.is_null() {
            unsafe { *num_bytes = 0 };
            return ptr::null_mut();
        }

        // Copy the string and add null terminator
        unsafe {
            std::ptr::copy_nonoverlapping(error_message.as_ptr(), c_str_ptr as *mut u8, error_len);
            *(c_str_ptr.add(error_len)) = 0;
        }

        return c_str_ptr;
    } else {
        unsafe { *num_bytes = 0 };
        ptr::null_mut() // Return null if no error message
    }
} 