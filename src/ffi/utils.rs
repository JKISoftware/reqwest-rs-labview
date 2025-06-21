use libc::c_char;
use std::ffi::c_void;

/// Exported function that destroys the memory allocated for a string
/// This *must* be called for every string returned from a function in this library
#[unsafe(no_mangle)]
pub extern "C" fn string_destroy(s: *mut c_char) {
    if s.is_null() {
        return;
    }
    unsafe {
        libc::free(s as *mut c_void);
    };
} 