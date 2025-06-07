use libc::c_char;
use reqwest::{
    header::{HeaderMap, HeaderName, HeaderValue},
    Client, ClientBuilder, StatusCode,
};
use std::{
    collections::HashMap,
    ffi::{c_void, CStr},
    ptr,
    sync::{Arc, Mutex, RwLock},
    time::Duration,
};

mod async_support;

// Types to track ongoing requests
type RequestId = u64;
type ProgressInfo = Arc<RwLock<RequestProgress>>;

// Global request tracker
lazy_static::lazy_static! {
    static ref REQUEST_TRACKER: Mutex<HashMap<RequestId, ProgressInfo>> = Mutex::new(HashMap::new());
    static ref NEXT_REQUEST_ID: Mutex<RequestId> = Mutex::new(1);
}

// Helper function to get next request ID
fn next_request_id() -> RequestId {
    let mut id = NEXT_REQUEST_ID.lock().unwrap();
    let current = *id;
    *id += 1;
    current
}

// Struct to track request progress
struct RequestProgress {
    status: RequestStatus,
    total_bytes: Option<u64>,
    received_bytes: u64,
    final_response: Option<Response>,
}

// Enum to track request status
#[derive(PartialEq)]
enum RequestStatus {
    InProgress,
    Completed,
    Error,
    Cancelled,
}

pub struct Response {
    status: StatusCode,
    headers: HeaderMap,
    body: Result<Vec<u8>, String>,
}

// Wrapper for the reqwest HeaderMap
pub struct ReqwestHeaderMap(HeaderMap);

// Create a new header map
#[no_mangle]
pub extern "C" fn headers_new() -> *mut ReqwestHeaderMap {
    Box::into_raw(Box::new(ReqwestHeaderMap(HeaderMap::new())))
}

// Free a header map
#[no_mangle]
pub extern "C" fn headers_free(map_ptr: *mut ReqwestHeaderMap) {
    if map_ptr.is_null() {
        return;
    }
    unsafe {
        let _ = Box::from_raw(map_ptr);
    }
}

// Add a header to the map
#[no_mangle]
pub extern "C" fn headers_add(
    map_ptr: *mut ReqwestHeaderMap,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if map_ptr.is_null() || key.is_null() || value.is_null() {
        return false;
    }

    let (key_str, value_str) = unsafe {
        let key_cstr = CStr::from_ptr(key);
        let value_cstr = CStr::from_ptr(value);
        (
            key_cstr.to_str().unwrap_or_default(),
            value_cstr.to_str().unwrap_or_default(),
        )
    };

    if key_str.is_empty() {
        return false;
    }

    let header_name = match HeaderName::from_bytes(key_str.as_bytes()) {
        Ok(name) => name,
        Err(_) => return false,
    };

    let header_value = match HeaderValue::from_str(value_str) {
        Ok(val) => val,
        Err(_) => return false,
    };

    unsafe { &mut *map_ptr }
        .0
        .append(header_name, header_value);
    true
}

// Wrapper for the reqwest ClientBuilder
pub struct ReqwestClientBuilder(ClientBuilder);

// Create a new client builder
#[no_mangle]
pub extern "C" fn client_builder_new() -> *mut ReqwestClientBuilder {
    Box::into_raw(Box::new(ReqwestClientBuilder(Client::builder())))
}

// Free a client builder if it's not used
#[no_mangle]
pub extern "C" fn client_builder_free(builder_ptr: *mut ReqwestClientBuilder) {
    if builder_ptr.is_null() {
        return;
    }
    unsafe {
        let _ = Box::from_raw(builder_ptr);
    }
}

// Set default headers for the client
#[no_mangle]
pub extern "C" fn client_builder_default_headers(
    builder_ptr: *mut ReqwestClientBuilder,
    headers_ptr: *mut ReqwestHeaderMap,
) -> *mut ReqwestClientBuilder {
    if builder_ptr.is_null() {
        return ptr::null_mut();
    }
    let headers = if headers_ptr.is_null() {
        HeaderMap::new()
    } else {
        unsafe { (*headers_ptr).0.clone() }
    };

    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).0)
    };
    unsafe { &mut *builder_ptr }.0 = builder.default_headers(headers);
    builder_ptr
}

// Set timeouts for the client
#[no_mangle]
pub extern "C" fn client_builder_timeout(
    builder_ptr: *mut ReqwestClientBuilder,
    connect_timeout_secs: u64,
    timeout_secs: u64,
) -> *mut ReqwestClientBuilder {
    if builder_ptr.is_null() {
        return ptr::null_mut();
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).0)
    };
    unsafe { &mut *builder_ptr }.0 = builder
        .connect_timeout(Duration::from_secs(connect_timeout_secs))
        .timeout(Duration::from_secs(timeout_secs));
    builder_ptr
}

// Set whether to accept invalid certificates
#[no_mangle]
pub extern "C" fn client_builder_danger_accept_invalid_certs(
    builder_ptr: *mut ReqwestClientBuilder,
    accept: bool,
) -> *mut ReqwestClientBuilder {
    if builder_ptr.is_null() {
        return ptr::null_mut();
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).0)
    };
    unsafe { &mut *builder_ptr }.0 = builder.danger_accept_invalid_certs(accept);
    builder_ptr
}

// Build the client from the builder
#[no_mangle]
pub extern "C" fn client_builder_build(builder_ptr: *mut ReqwestClientBuilder) -> *mut c_void {
    if builder_ptr.is_null() {
        return ptr::null_mut();
    }

    let builder = unsafe { Box::from_raw(builder_ptr) };

    let client = match builder.0.build() {
        Ok(c) => c,
        Err(e) => {
            println!("Failed to build client: {}", e);
            return ptr::null_mut();
        }
    };

    // Box the client to be passed as a raw pointer
    Box::into_raw(Box::new(client)) as *mut c_void
}

// Close a reqwest client and free the memory
#[no_mangle]
pub extern "C" fn client_close(client_ptr: *mut c_void) {
    if client_ptr.is_null() {
        return;
    }

    unsafe {
        let _ = Box::from_raw(client_ptr as *mut Client);
    }
}

// Start an asynchronous GET request and return a request ID
#[no_mangle]
pub extern "C" fn async_get_start(
    client_ptr: *mut c_void,
    url: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
    file_path: *const c_char,
) -> RequestId {
    if client_ptr.is_null() {
        return 0;
    }

    let client = unsafe { &*(client_ptr as *const Client) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s.to_string(),
        Err(_) => {
            println!("Invalid URL string");
            return 0;
        }
    };

    let file_path_str = if !file_path.is_null() {
        match unsafe { CStr::from_ptr(file_path).to_str() } {
            Ok(s) if !s.is_empty() => Some(s.to_string()),
            _ => None,
        }
    } else {
        None
    };

    let request_headers = if !headers_ptr.is_null() {
        unsafe { (*headers_ptr).0.clone() }
    } else {
        HeaderMap::new()
    };

    // Create a new request ID
    let request_id = next_request_id();

    // Create a progress info struct
    let progress_info = Arc::new(RwLock::new(RequestProgress {
        status: RequestStatus::InProgress,
        total_bytes: None,
        received_bytes: 0,
        final_response: None,
    }));

    // Store the progress info
    {
        let mut tracker = REQUEST_TRACKER.lock().unwrap();
        tracker.insert(request_id, progress_info.clone());
    }

    // Clone the URL for the async task
    let url_clone = url_str.clone();
    let client_clone = client.clone();

    // Spawn the async task
    let request_future = client_clone.get(&url_clone).headers(request_headers).send();
    async_support::spawn_and_process_request(request_future, progress_info, file_path_str);

    request_id
}

// Start an asynchronous POST request with a JSON body and return a request ID
#[no_mangle]
pub extern "C" fn async_post_json_start(
    client_ptr: *mut c_void,
    url: *const c_char,
    json_body: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
) -> RequestId {
    if client_ptr.is_null() || url.is_null() || json_body.is_null() {
        return 0;
    }

    let client = unsafe { &*(client_ptr as *const Client) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s.to_string(),
        Err(_) => return 0,
    };
    let json_body_str = match unsafe { CStr::from_ptr(json_body).to_str() } {
        Ok(s) => s.to_string(),
        Err(_) => return 0,
    };

    let request_headers = if !headers_ptr.is_null() {
        unsafe { (*headers_ptr).0.clone() }
    } else {
        HeaderMap::new()
    };

    let request_id = next_request_id();
    let progress_info = Arc::new(RwLock::new(RequestProgress {
        status: RequestStatus::InProgress,
        total_bytes: None,
        received_bytes: 0,
        final_response: None,
    }));

    {
        let mut tracker = REQUEST_TRACKER.lock().unwrap();
        tracker.insert(request_id, progress_info.clone());
    }

    let url_clone = url_str.clone();
    let client_clone = client.clone();

    let request_future = client_clone
        .post(&url_clone)
        .header("Content-Type", "application/json")
        .headers(request_headers)
        .body(json_body_str)
        .send();
    async_support::spawn_and_process_request(request_future, progress_info, None);

    request_id
}

// Start an asynchronous PUT request with a JSON body and return a request ID
#[no_mangle]
pub extern "C" fn async_put_json_start(
    client_ptr: *mut c_void,
    url: *const c_char,
    json_body: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
) -> RequestId {
    if client_ptr.is_null() || url.is_null() || json_body.is_null() {
        return 0;
    }

    let client = unsafe { &*(client_ptr as *const Client) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s.to_string(),
        Err(_) => return 0,
    };
    let json_body_str = match unsafe { CStr::from_ptr(json_body).to_str() } {
        Ok(s) => s.to_string(),
        Err(_) => return 0,
    };

    let request_headers = if !headers_ptr.is_null() {
        unsafe { (*headers_ptr).0.clone() }
    } else {
        HeaderMap::new()
    };

    let request_id = next_request_id();
    let progress_info = Arc::new(RwLock::new(RequestProgress {
        status: RequestStatus::InProgress,
        total_bytes: None,
        received_bytes: 0,
        final_response: None,
    }));

    {
        let mut tracker = REQUEST_TRACKER.lock().unwrap();
        tracker.insert(request_id, progress_info.clone());
    }

    let url_clone = url_str.clone();
    let client_clone = client.clone();

    let request_future = client_clone
        .put(&url_clone)
        .header("Content-Type", "application/json")
        .headers(request_headers)
        .body(json_body_str)
        .send();
    async_support::spawn_and_process_request(request_future, progress_info, None);

    request_id
}

// Start an asynchronous DELETE request and return a request ID
#[no_mangle]
pub extern "C" fn async_delete_start(
    client_ptr: *mut c_void,
    url: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
) -> RequestId {
    if client_ptr.is_null() || url.is_null() {
        return 0;
    }

    let client = unsafe { &*(client_ptr as *const Client) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s.to_string(),
        Err(_) => return 0,
    };

    let request_headers = if !headers_ptr.is_null() {
        unsafe { (*headers_ptr).0.clone() }
    } else {
        HeaderMap::new()
    };

    let request_id = next_request_id();
    let progress_info = Arc::new(RwLock::new(RequestProgress {
        status: RequestStatus::InProgress,
        total_bytes: None,
        received_bytes: 0,
        final_response: None,
    }));

    {
        let mut tracker = REQUEST_TRACKER.lock().unwrap();
        tracker.insert(request_id, progress_info.clone());
    }

    let url_clone = url_str.clone();
    let client_clone = client.clone();

    let request_future = client_clone
        .delete(&url_clone)
        .headers(request_headers)
        .send();
    async_support::spawn_and_process_request(request_future, progress_info, None);

    request_id
}

#[no_mangle]
pub extern "C" fn async_is_complete(request_id: RequestId) -> bool {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        match progress.status {
            RequestStatus::Completed | RequestStatus::Error | RequestStatus::Cancelled => true,
            RequestStatus::InProgress => false,
        }
    } else {
        true
    }
}

#[no_mangle]
pub extern "C" fn async_get_progress(request_id: RequestId) -> i32 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();

        if let Some(total) = progress.total_bytes {
            if total > 0 {
                return ((progress.received_bytes as f64 / total as f64) * 100.0) as i32;
            }
        }

        match progress.status {
            RequestStatus::Completed => 100,
            RequestStatus::Error | RequestStatus::Cancelled => -1,
            RequestStatus::InProgress => 0,
        }
    } else {
        -1
    }
}

#[no_mangle]
pub extern "C" fn async_get_total_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.total_bytes.unwrap_or(0)
    } else {
        0
    }
}

#[no_mangle]
pub extern "C" fn async_get_received_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.received_bytes
    } else {
        0
    }
}

// Take the response from a completed request. This consumes the response.
#[no_mangle]
pub extern "C" fn async_take_result(request_id: RequestId) -> *mut Response {
    let mut tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get_mut(&request_id) {
        let mut progress = progress_info.write().unwrap();
        if let Some(response) = progress.final_response.take() {
            return Box::into_raw(Box::new(response));
        }
    }

    ptr::null_mut()
}

// Get the status code from a response
#[no_mangle]
pub extern "C" fn response_status(response_ptr: *const Response) -> u16 {
    if response_ptr.is_null() {
        return 0;
    }
    let response = unsafe { &*response_ptr };
    response.status.as_u16()
}

// Get the response headers
#[no_mangle]
pub extern "C" fn response_headers(response_ptr: *const Response) -> *mut ReqwestHeaderMap {
    if response_ptr.is_null() {
        return ptr::null_mut();
    }
    let response = unsafe { &*response_ptr };
    Box::into_raw(Box::new(ReqwestHeaderMap(response.headers.clone())))
}

// Get the response body. Returns the number of bytes written to the buffer.
#[no_mangle]
pub extern "C" fn response_body_copy(
    response_ptr: *const Response,
    buffer: *mut u8,
    buffer_len: u32,
) -> u32 {
    if response_ptr.is_null() {
        return 0;
    }
    let response = unsafe { &*response_ptr };
    if let Ok(body) = &response.body {
        let len = std::cmp::min(body.len(), buffer_len as usize);
        unsafe {
            std::ptr::copy_nonoverlapping(body.as_ptr(), buffer, len);
        }
        len as u32
    } else {
        0
    }
}

// Get the error string. Returns the number of bytes written to the buffer.
#[no_mangle]
pub extern "C" fn response_error_string_copy(
    response_ptr: *const Response,
    buffer: *mut u8,
    buffer_len: u32,
) -> u32 {
    if response_ptr.is_null() {
        return 0;
    }
    let response = unsafe { &*response_ptr };
    if let Err(error) = &response.body {
        let error_bytes = error.as_bytes();
        let len = std::cmp::min(error_bytes.len(), buffer_len as usize);
        unsafe {
            std::ptr::copy_nonoverlapping(error_bytes.as_ptr(), buffer, len);
        }
        len as u32
    } else {
        0
    }
}

// Free a response object
#[no_mangle]
pub extern "C" fn response_free(response_ptr: *mut Response) {
    if response_ptr.is_null() {
        return;
    }
    unsafe {
        let _ = Box::from_raw(response_ptr);
    }
}

#[no_mangle]
pub extern "C" fn async_cancel(request_id: RequestId) -> bool {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let mut progress = progress_info.write().unwrap();

        if progress.status == RequestStatus::InProgress {
            progress.status = RequestStatus::Cancelled;
            return true;
        }
    }
    false
}

#[no_mangle]
pub extern "C" fn async_cleanup(request_id: RequestId) {
    let mut tracker = REQUEST_TRACKER.lock().unwrap();
    tracker.remove(&request_id);
}

// exported function that frees the memory allocated for a string
// this *must* be called for every string returned from a function in this library
#[no_mangle]
pub extern "C" fn free_memory(s: *mut c_char) {
    if s.is_null() {
        return;
    }
    unsafe { libc::free(s as *mut c_void); };
}