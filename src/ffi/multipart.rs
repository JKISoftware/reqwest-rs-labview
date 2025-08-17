use crate::types::MultipartFormWrapper;
use libc::c_char;
use reqwest::multipart;
use std::{ffi::CStr, ptr};

/// Create a new multipart form
#[unsafe(no_mangle)]
pub extern "C" fn multipart_form_create() -> *mut MultipartFormWrapper {
    let form = multipart::Form::new();
    Box::into_raw(Box::new(MultipartFormWrapper {
        form: Some(form),
        error_message: None,
    }))
}

/// Destroy a multipart form
#[unsafe(no_mangle)]
pub extern "C" fn multipart_form_destroy(form_ptr: *mut MultipartFormWrapper) {
    if !form_ptr.is_null() {
        unsafe {
            let _ = Box::from_raw(form_ptr);
        }
    }
}

/// Add a text field to the multipart form
#[unsafe(no_mangle)]
pub extern "C" fn multipart_form_add_text(
    form_ptr: *mut MultipartFormWrapper,
    name: *const c_char,
    value: *const c_char,
) -> bool {
    if form_ptr.is_null() || name.is_null() || value.is_null() {
        return false;
    }

    let wrapper = unsafe { &mut *form_ptr };

    // Check if there's already an error
    if wrapper.error_message.is_some() {
        return false;
    }

    // Parse the C strings
    let (name_str, value_str) = unsafe {
        let name_cstr = CStr::from_ptr(name);
        let value_cstr = CStr::from_ptr(value);
        (
            match name_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    wrapper.error_message = Some("Field name contains invalid UTF-8".to_string());
                    return false;
                }
            },
            match value_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    wrapper.error_message = Some("Field value contains invalid UTF-8".to_string());
                    return false;
                }
            },
        )
    };

    if name_str.is_empty() {
        wrapper.error_message = Some("Field name cannot be empty".to_string());
        return false;
    }

    // Add the text field to the form
    if let Some(form) = wrapper.form.take() {
        wrapper.form = Some(form.text(name_str.to_string(), value_str.to_string()));
        true
    } else {
        wrapper.error_message = Some("Multipart form was already consumed".to_string());
        false
    }
}

/// Add a file to the multipart form
#[unsafe(no_mangle)]
pub extern "C" fn multipart_form_add_file(
    form_ptr: *mut MultipartFormWrapper,
    name: *const c_char,
    file_path: *const c_char,
) -> bool {
    if form_ptr.is_null() || name.is_null() || file_path.is_null() {
        return false;
    }

    let wrapper = unsafe { &mut *form_ptr };

    // Check if there's already an error
    if wrapper.error_message.is_some() {
        return false;
    }

    // Parse the C strings
    let (name_str, path_str) = unsafe {
        let name_cstr = CStr::from_ptr(name);
        let path_cstr = CStr::from_ptr(file_path);
        (
            match name_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    wrapper.error_message = Some("Field name contains invalid UTF-8".to_string());
                    return false;
                }
            },
            match path_cstr.to_str() {
                Ok(s) => s,
                Err(_) => {
                    wrapper.error_message = Some("File path contains invalid UTF-8".to_string());
                    return false;
                }
            },
        )
    };

    if name_str.is_empty() {
        wrapper.error_message = Some("Field name cannot be empty".to_string());
        return false;
    }

    // Read the file
    let file_bytes = match std::fs::read(path_str) {
        Ok(bytes) => bytes,
        Err(e) => {
            wrapper.error_message = Some(format!("Failed to read file: {e}"));
            return false;
        }
    };

    // Extract filename from path
    let filename = std::path::Path::new(path_str)
        .file_name()
        .and_then(|n| n.to_str())
        .unwrap_or("file")
        .to_string();

    // Create a part with the file data
    let part = multipart::Part::bytes(file_bytes).file_name(filename);

    // Add the file part to the form
    if let Some(form) = wrapper.form.take() {
        wrapper.form = Some(form.part(name_str.to_string(), part));
        true
    } else {
        wrapper.error_message = Some("Multipart form was already consumed".to_string());
        false
    }
}

/// Add binary data as a file part to the multipart form
#[unsafe(no_mangle)]
pub extern "C" fn multipart_form_add_bytes(
    form_ptr: *mut MultipartFormWrapper,
    name: *const c_char,
    data: *const u8,
    data_len: usize,
    filename: *const c_char,
    mime_type: *const c_char,
) -> bool {
    if form_ptr.is_null() || name.is_null() || data.is_null() || data_len == 0 {
        return false;
    }

    let wrapper = unsafe { &mut *form_ptr };

    // Check if there's already an error
    if wrapper.error_message.is_some() {
        return false;
    }

    // Parse the name
    let name_str = unsafe {
        match CStr::from_ptr(name).to_str() {
            Ok(s) => s,
            Err(_) => {
                wrapper.error_message = Some("Field name contains invalid UTF-8".to_string());
                return false;
            }
        }
    };

    if name_str.is_empty() {
        wrapper.error_message = Some("Field name cannot be empty".to_string());
        return false;
    }

    // Copy the data
    let data_vec = unsafe { std::slice::from_raw_parts(data, data_len).to_vec() };

    // Create the part
    let mut part = multipart::Part::bytes(data_vec);

    // Add filename if provided
    if !filename.is_null() {
        if let Ok(filename_str) = unsafe { CStr::from_ptr(filename).to_str() } {
            if !filename_str.is_empty() {
                part = part.file_name(filename_str.to_string());
            }
        }
    }

    // Add MIME type if provided
    if !mime_type.is_null() {
        if let Ok(mime_str) = unsafe { CStr::from_ptr(mime_type).to_str() } {
            if !mime_str.is_empty() {
                match part.mime_str(mime_str) {
                    Ok(p) => part = p,
                    Err(e) => {
                        wrapper.error_message = Some(format!("Invalid MIME type: {e}"));
                        return false;
                    }
                }
            }
        }
    }

    // Add the part to the form
    if let Some(form) = wrapper.form.take() {
        wrapper.form = Some(form.part(name_str.to_string(), part));
        true
    } else {
        wrapper.error_message = Some("Multipart form was already consumed".to_string());
        false
    }
}

/// Get the last error message from a multipart form
#[unsafe(no_mangle)]
pub extern "C" fn multipart_form_read_error_message(
    form_ptr: *mut MultipartFormWrapper,
    num_bytes: *mut u32,
) -> *mut c_char {
    if form_ptr.is_null() || num_bytes.is_null() {
        if !num_bytes.is_null() {
            unsafe { *num_bytes = 0 };
        }
        return ptr::null_mut();
    }

    let wrapper = unsafe { &mut *form_ptr };

    if let Some(error_message) = wrapper.error_message.take() {
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

        c_str_ptr
    } else {
        unsafe { *num_bytes = 0 };
        ptr::null_mut()
    }
}
