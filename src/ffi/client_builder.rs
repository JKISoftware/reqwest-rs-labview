use crate::{
    helpers::convert_tls_version,
    types::{ClientBuilderWrapper, HeaderMapWrapper},
};
use libc::c_char;
use std::{ffi::CStr, ptr, time::Duration};

// Client Builder Functions

/// Create a new client builder
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_create() -> *mut ClientBuilderWrapper {
    Box::into_raw(Box::new(ClientBuilderWrapper {
        builder: reqwest::Client::builder(),
        error_message: None,
    }))
}

/// Destroy a client builder if it's not used
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_destroy(builder_ptr: *mut ClientBuilderWrapper) {
    if builder_ptr.is_null() {
        return;
    }
    unsafe {
        let _ = Box::from_raw(builder_ptr);
    }
}

/// Set default headers for the client
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_default_headers(
    builder_ptr: *mut ClientBuilderWrapper,
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

    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).builder)
    };
    unsafe { &mut *builder_ptr }.builder = builder.default_headers(headers);
    true
}

/// Set timeout for the client
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_timeout_ms(
    builder_ptr: *mut ClientBuilderWrapper,
    timeout_ms: u64,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).builder)
    };
    unsafe { &mut *builder_ptr }.builder = builder.timeout(Duration::from_millis(timeout_ms));
    true
}

/// Set connect_timeout for the client
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_connect_timeout_ms(
    builder_ptr: *mut ClientBuilderWrapper,
    connect_timeout_ms: u64,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).builder)
    };
    unsafe { &mut *builder_ptr }.builder =
        builder.connect_timeout(Duration::from_millis(connect_timeout_ms));
    true
}

/// Set whether to accept invalid certificates
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_danger_accept_invalid_certs(
    builder_ptr: *mut ClientBuilderWrapper,
    accept: bool,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).builder)
    };
    unsafe { &mut *builder_ptr }.builder = builder.danger_accept_invalid_certs(accept);
    true
}

/// Set the minimum TLS version
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_min_tls_version(
    builder_ptr: *mut ClientBuilderWrapper,
    version: u8,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }

    let tls_version = match convert_tls_version(version) {
        Some(v) => v,
        None => return false,
    };

    let builder = unsafe { std::mem::take(&mut (*builder_ptr).builder) };
    unsafe { &mut *builder_ptr }.builder = builder.min_tls_version(tls_version);
    true
}

/// Set HTTPS proxy for the client
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_https_proxy(
    builder_ptr: *mut ClientBuilderWrapper,
    proxy_url: *const c_char,
) -> bool {
    if builder_ptr.is_null() || proxy_url.is_null() {
        return false;
    }
    let builder_wrapper = unsafe { &mut *builder_ptr };

    let proxy_url_str = unsafe {
        match CStr::from_ptr(proxy_url).to_str() {
            Ok(s) => s,
            Err(_) => {
                builder_wrapper.error_message = Some("Invalid UTF-8 in proxy URL".to_string());
                return false;
            }
        }
    };

    let proxy = match reqwest::Proxy::https(proxy_url_str) {
        Ok(p) => p,
        Err(e) => {
            // This can fail if the URL is invalid.
            builder_wrapper.error_message = Some(format!("Invalid proxy URL: {}", e));
            return false;
        }
    };

    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).builder)
    };
    unsafe { &mut *builder_ptr }.builder = builder.proxy(proxy);
    true
}

/// Set a proxy for all protocols with optional authentication.
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_set_proxy(
    builder_ptr: *mut ClientBuilderWrapper,
    server: *const c_char,
    port: u16,
    username: *const c_char,
    password: *const c_char,
) -> bool {
    if builder_ptr.is_null() || server.is_null() {
        return false;
    }
    let builder_wrapper = unsafe { &mut *builder_ptr };

    let server_str = unsafe {
        match CStr::from_ptr(server).to_str() {
            Ok(s) => s,
            Err(_) => {
                builder_wrapper.error_message = Some("Invalid UTF-8 in proxy server".to_string());
                return false;
            }
        }
    };

    if server_str.is_empty() {
        builder_wrapper.error_message = Some("Proxy server cannot be empty".to_string());
        return false;
    }

    let proxy_url = format!("http://{}:{}", server_str, port);

    let mut proxy = match reqwest::Proxy::all(&proxy_url) {
        Ok(p) => p,
        Err(e) => {
            builder_wrapper.error_message = Some(format!("Invalid proxy URL: {}", e));
            return false;
        }
    };

    let username_str = if !username.is_null() {
        unsafe {
            match CStr::from_ptr(username).to_str() {
                Ok(s) => s,
                Err(_) => {
                    builder_wrapper.error_message =
                        Some("Invalid UTF-8 in proxy username".to_string());
                    return false;
                }
            }
        }
    } else {
        "" // empty string if null
    };

    if !username_str.is_empty() {
        let password_str = if !password.is_null() {
            unsafe {
                match CStr::from_ptr(password).to_str() {
                    Ok(s) => s,
                    Err(_) => {
                        builder_wrapper.error_message =
                            Some("Invalid UTF-8 in proxy password".to_string());
                        return false;
                    }
                }
            }
        } else {
            "" // empty string if null
        };
        proxy = proxy.basic_auth(username_str, password_str);
    }

    let builder = unsafe { std::mem::take(&mut (*builder_ptr).builder) };
    unsafe { &mut *builder_ptr }.builder = builder.proxy(proxy);
    true
}

/// Disable proxy for the client
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_no_proxy(builder_ptr: *mut ClientBuilderWrapper) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).builder)
    };
    unsafe { &mut *builder_ptr }.builder = builder.no_proxy();
    true
}

/// Get the last error message from a ClientBuilder as a C string.
/// This function consumes the error message string, so the builder's
/// error state is cleared after the read.
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_read_error_message(
    builder_ptr: *mut ClientBuilderWrapper,
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

/// Set the User-Agent header for the client.
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_user_agent(
    builder_ptr: *mut ClientBuilderWrapper,
    user_agent: *const c_char,
) -> bool {
    if builder_ptr.is_null() || user_agent.is_null() {
        return false;
    }

    let builder_wrapper = unsafe { &mut *builder_ptr };

    let user_agent_str = unsafe {
        match CStr::from_ptr(user_agent).to_str() {
            Ok(s) => s,
            Err(_) => {
                builder_wrapper.error_message =
                    Some("User agent contains invalid UTF-8".to_string());
                return false;
            }
        }
    };

    let builder = unsafe { std::mem::take(&mut (*builder_ptr).builder) };
    // The error is stored inside the builder and will be returned by `build()`.
    unsafe { &mut *builder_ptr }.builder = builder.user_agent(user_agent_str);
    true
} 