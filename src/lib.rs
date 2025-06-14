use libc::c_char;
use reqwest::{
    header::{HeaderMap, HeaderName, HeaderValue},
    Client, ClientBuilder, StatusCode, RequestBuilder,
    tls,
};
use std::{
    collections::{HashMap, HashSet},
    ffi::{c_void, CStr},
    ptr,
    sync::{Arc, Mutex, RwLock},
    time::Duration,
};
use serde_json;

mod async_support;

// Types to track ongoing requests
type RequestId = u64;
type ClientId = u64;
type ProgressInfo = Arc<RwLock<RequestProgress>>;

// Global runtime and request tracker
lazy_static::lazy_static! {
    static ref REQUEST_TRACKER: Mutex<HashMap<RequestId, ProgressInfo>> = Mutex::new(HashMap::new());
    static ref NEXT_REQUEST_ID: Mutex<RequestId> = Mutex::new(1);
    static ref CLIENTS: Mutex<HashMap<ClientId, ClientWrapper>> = Mutex::new(HashMap::new());
    static ref NEXT_CLIENT_ID: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(1);
    static ref CLIENT_REQUESTS: Mutex<HashMap<ClientId, HashSet<RequestId>>> = Mutex::new(HashMap::new());
    static ref GLOBAL_RUNTIME: tokio::runtime::Runtime = tokio::runtime::Builder::new_multi_thread()
            .enable_all()
            .build()
            .expect("Failed to create global Tokio runtime");
}

// Thread-local storage for the last error message
thread_local! {
    static LAST_ERROR: std::cell::RefCell<Option<String>> = std::cell::RefCell::new(None);
}

// Helper function to set the last error message
fn set_last_error(error: String) {
    LAST_ERROR.with(|cell| {
        *cell.borrow_mut() = Some(error);
    });
}

// Helper function to get and clear the last error message
fn take_last_error() -> Option<String> {
    LAST_ERROR.with(|cell| {
        cell.borrow_mut().take()
    })
}

// Helper function to create a new request ID
fn request_builder_new_request_id() -> RequestId {
    let mut id = NEXT_REQUEST_ID.lock().unwrap();
    let current = *id;
    *id += 1;
    current
}

// Helper function to register a request with a client
fn client_register_request(client_id: ClientId, request_id: RequestId) {
    let mut client_requests = CLIENT_REQUESTS.lock().unwrap();
    client_requests.entry(client_id).or_insert_with(HashSet::new).insert(request_id);
}

// Helper function to mark all requests for a client as cancelled
fn client_cancel_requests(client_id: ClientId) {
    let requests_to_cancel = {
        let mut client_requests = CLIENT_REQUESTS.lock().unwrap();
        client_requests.remove(&client_id).unwrap_or_default()
    };
    
    let tracker = REQUEST_TRACKER.lock().unwrap();
    for request_id in requests_to_cancel {
        if let Some(progress_info) = tracker.get(&request_id) {
            let mut progress = progress_info.write().unwrap();
            if progress.status == RequestStatus::InProgress {
                progress.status = RequestStatus::Cancelled;
            }
        }
    }
}

// Struct to track progress of the request (i.e. the response)
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
pub struct HeaderMapWrapper(HeaderMap);

// Wrapper for the reqwest Client
pub struct ClientWrapper(Client);

// Create a new header map
#[no_mangle]
pub extern "C" fn headers_new() -> *mut HeaderMapWrapper {
    Box::into_raw(Box::new(HeaderMapWrapper(HeaderMap::new())))
}

// Free a header map
#[no_mangle]
pub extern "C" fn headers_free(map_ptr: *mut HeaderMapWrapper) {
    if map_ptr.is_null() {
        return;
    }
    unsafe {
        let _ = Box::from_raw(map_ptr);
    }
}

// Get all headers as a multi-line string with "key: value" format
#[no_mangle]
pub extern "C" fn headers_get_all(
    map_ptr: *mut HeaderMapWrapper,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }
    if map_ptr.is_null() {
        unsafe { *num_bytes = 0 };
        return ptr::null_mut();
    }

    let header_map = unsafe { &(*map_ptr).0 };
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

// Add a header to the map
#[no_mangle]
pub extern "C" fn headers_add(
    map_ptr: *mut HeaderMapWrapper,
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
pub struct ClientBuilderWrapper {
    builder: ClientBuilder,
}

// Create a new client builder
#[no_mangle]
pub extern "C" fn client_builder_new() -> *mut ClientBuilderWrapper {
    Box::into_raw(Box::new(ClientBuilderWrapper {
        builder: Client::builder(),
    }))
}

// Free a client builder if it's not used
#[no_mangle]
pub extern "C" fn client_builder_free(builder_ptr: *mut ClientBuilderWrapper) {
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
    builder_ptr: *mut ClientBuilderWrapper,
    headers_ptr: *mut HeaderMapWrapper,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let headers = if headers_ptr.is_null() {
        HeaderMap::new()
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

// Set timeout for the client
#[no_mangle]
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
    unsafe { &mut *builder_ptr }.builder = builder
        .timeout(Duration::from_millis(timeout_ms));
    true
}

// Set connect_timeout for the client
#[no_mangle]
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
    unsafe { &mut *builder_ptr }.builder = builder
        .connect_timeout(Duration::from_millis(connect_timeout_ms));
    true
}

// Set whether to accept invalid certificates
#[no_mangle]
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

// TLS Version constants
// These values should match the enum values defined in LabVIEW if any.
// We only expose the versions relevant for testing this feature.
const TLS_VERSION_1_2: u8 = 1;
const TLS_VERSION_1_3: u8 = 2;

// Helper function to convert version integer to reqwest::tls::Version
fn convert_tls_version(version: u8) -> Option<tls::Version> {
    match version {
        TLS_VERSION_1_2 => Some(tls::Version::TLS_1_2),
        TLS_VERSION_1_3 => Some(tls::Version::TLS_1_3),
        _ => None,
    }
}

// Set the minimum TLS version
#[no_mangle]
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
    
    let builder = unsafe {
        std::mem::take(&mut (*builder_ptr).builder)
    };
    unsafe { &mut *builder_ptr }.builder = builder.min_tls_version(tls_version);
    true
}


// Set HTTPS proxy for the client
#[no_mangle]
pub extern "C" fn client_builder_set_https_proxy(
    builder_ptr: *mut ClientBuilderWrapper,
    proxy_url: *const c_char,
) -> bool {
    if builder_ptr.is_null() || proxy_url.is_null() {
        return false;
    }

    let proxy_url_str = unsafe {
        match CStr::from_ptr(proxy_url).to_str() {
            Ok(s) => s,
            Err(_) => {
                set_last_error("Invalid UTF-8 in proxy URL".to_string());
                return false;
            }
        }
    };

    let proxy = match reqwest::Proxy::https(proxy_url_str) {
        Ok(p) => p,
        Err(e) => {
            // This can fail if the URL is invalid.
            set_last_error(format!("Invalid proxy URL: {}", e));
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


// Build the client from the builder
#[no_mangle]
pub extern "C" fn client_builder_build(
    builder_ptr: *mut ClientBuilderWrapper,
) -> ClientId {
    if builder_ptr.is_null() {
        return 0;
    }

    let builder_wrapper = unsafe { Box::from_raw(builder_ptr) };

    // Use the global runtime to build the client
    let client_result = GLOBAL_RUNTIME.block_on(async {
        builder_wrapper.builder.build()
    });

    match client_result {
        Ok(client) => {
            let client_wrapper = ClientWrapper(client);
            let client_id = NEXT_CLIENT_ID.fetch_add(1, std::sync::atomic::Ordering::SeqCst);
            
            let mut clients = CLIENTS.lock().unwrap();
            clients.insert(client_id, client_wrapper);

            // Initialize an empty set of request IDs for this client
            CLIENT_REQUESTS.lock().unwrap().insert(client_id, HashSet::new());
            
            client_id
        },
        Err(e) => {
            // Store the error message for later retrieval
            set_last_error(format!("Failed to build client: {}", e));
            0 // Return 0 to indicate failure
        }
    }
}

// Close a reqwest client and free the memory
#[no_mangle]
pub extern "C" fn client_close(client_id: ClientId) {
    if client_id == 0 {
        return;
    }
    
    // Cancel all pending requests for this client
    client_cancel_requests(client_id);
    
    // Wait for any pending operations to complete
    GLOBAL_RUNTIME.block_on(async {
        // Allow some time for cancellation to take effect
        tokio::time::sleep(Duration::from_millis(100)).await;
    });
    
    // Remove and drop the client
    let mut clients = CLIENTS.lock().unwrap();
    clients.remove(&client_id);
    
    // Yield to ensure proper cleanup
    GLOBAL_RUNTIME.block_on(async {
        tokio::task::yield_now().await;
    });
}

// HTTP method constants (internal use only)
// These values should match the enum values defined in LabVIEW
// 1: GET
// 2: POST
// 3: PUT
// 4: DELETE
// 5: HEAD
// 6: OPTIONS
// 7: CONNECT
// 8: PATCH
// 9: TRACE
const HTTP_METHOD_GET: u8 = 1;
const HTTP_METHOD_POST: u8 = 2;
const HTTP_METHOD_PUT: u8 = 3;
const HTTP_METHOD_DELETE: u8 = 4;
const HTTP_METHOD_HEAD: u8 = 5;
const HTTP_METHOD_OPTIONS: u8 = 6;
const HTTP_METHOD_CONNECT: u8 = 7;
const HTTP_METHOD_PATCH: u8 = 8;
const HTTP_METHOD_TRACE: u8 = 9;

// Helper function to convert method integer to reqwest::Method
fn convert_method(method: u8) -> Option<reqwest::Method> {
    match method {
        HTTP_METHOD_GET => Some(reqwest::Method::GET),
        HTTP_METHOD_POST => Some(reqwest::Method::POST),
        HTTP_METHOD_PUT => Some(reqwest::Method::PUT),
        HTTP_METHOD_DELETE => Some(reqwest::Method::DELETE),
        HTTP_METHOD_HEAD => Some(reqwest::Method::HEAD),
        HTTP_METHOD_OPTIONS => Some(reqwest::Method::OPTIONS),
        HTTP_METHOD_CONNECT => Some(reqwest::Method::CONNECT),
        HTTP_METHOD_PATCH => Some(reqwest::Method::PATCH),
        HTTP_METHOD_TRACE => Some(reqwest::Method::TRACE),
        _ => None,
    }
}

#[no_mangle]
pub extern "C" fn request_is_complete(request_id: RequestId) -> bool {
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
pub extern "C" fn request_read_progress(request_id: RequestId) -> i32 {
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
pub extern "C" fn request_read_total_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.total_bytes.unwrap_or(0)
    } else {
        0
    }
}

#[no_mangle]
pub extern "C" fn request_read_received_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();

    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.received_bytes
    } else {
        0
    }
}

// Get the response body as a C string directly from a request ID
#[no_mangle]
pub extern "C" fn request_read_response_body(
    request_id: RequestId,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }
    
    // Get the response info directly from the tracker
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            // If there's an error in the response, return null
            let body = match &response.body {
                Ok(body_bytes) => body_bytes,
                Err(_) => {
                    unsafe { *num_bytes = 0 };
                    return ptr::null_mut();
                }
            };
            
            // Calculate size including null terminator
            let body_len = body.len();
            unsafe { *num_bytes = body_len as u32 };
            
            // Allocate memory for the string + null terminator
            let c_str_ptr = unsafe { libc::malloc(body_len + 1) as *mut c_char };
            if c_str_ptr.is_null() {
                return ptr::null_mut();
            }
            
            // Copy the bytes and add null terminator
            unsafe {
                std::ptr::copy_nonoverlapping(body.as_ptr(), c_str_ptr as *mut u8, body_len);
                *(c_str_ptr.add(body_len)) = 0;
            }
            
            return c_str_ptr;
        }
    }
    
    unsafe { *num_bytes = 0 };
    ptr::null_mut() // Return null if request not found or no response yet
}

// Get the error message as a C string directly from a request ID
#[no_mangle]
pub extern "C" fn request_read_response_error(
    request_id: RequestId,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }
    
    // Get the response info directly from the tracker
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            // If there's no error in the response, return null
            let error_str = match &response.body {
                Err(error_str) => error_str,
                Ok(_) => {
                    unsafe { *num_bytes = 0 };
                    return ptr::null_mut();
                }
            };
            
            // Calculate size including null terminator
            let str_len = error_str.len();
            unsafe { *num_bytes = str_len as u32 };
            
            // Allocate memory for the string + null terminator
            let c_str_ptr = unsafe { libc::malloc(str_len + 1) as *mut c_char };
            if c_str_ptr.is_null() {
                return ptr::null_mut();
            }
            
            // Copy the string and add null terminator
            unsafe {
                std::ptr::copy_nonoverlapping(error_str.as_ptr(), c_str_ptr as *mut u8, str_len);
                *(c_str_ptr.add(str_len)) = 0;
            }
            
            return c_str_ptr;
        }
    }
    
    unsafe { *num_bytes = 0 };
    ptr::null_mut() // Return null if request not found or no response yet
}

#[no_mangle]
pub extern "C" fn request_cancel(request_id: RequestId) -> bool {
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
pub extern "C" fn request_cleanup(request_id: RequestId) {
    // Remove the request from the tracker
    let mut tracker = REQUEST_TRACKER.lock().unwrap();
    tracker.remove(&request_id);
    
    // Remove the request from any client that might have it
    let mut client_requests = CLIENT_REQUESTS.lock().unwrap();
    for (_, requests) in client_requests.iter_mut() {
        requests.remove(&request_id);
    }
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

// Get the status code directly from a request ID
#[no_mangle]
pub extern "C" fn request_read_response_status(request_id: RequestId) -> u16 {
    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return response.status.as_u16();
        }
    }
    
    0 // Return 0 if request not found or no response yet
}

// Get the response headers directly from a request ID
#[no_mangle]
pub extern "C" fn request_read_response_headers(request_id: RequestId) -> *mut HeaderMapWrapper {
    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return Box::into_raw(Box::new(HeaderMapWrapper(response.headers.clone())));
        }
    }
    
    ptr::null_mut() // Return null if request not found or no response yet
}

// Check if a request has an error
#[no_mangle]
pub extern "C" fn request_has_response_error(request_id: RequestId) -> bool {
    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return response.body.is_err();
        }
    }
    
    false // Return false if request not found or no response yet
}

// Wrapper for the reqwest RequestBuilder
pub struct RequestBuilderWrapper {
    builder: Option<RequestBuilder>,
    client_id: ClientId,
    output_file_path: Option<String>,
}

impl RequestBuilderWrapper {
    // Helper method to take the builder out, apply a function, and put it back
    fn with_builder<F>(&mut self, f: F) -> bool
    where
        F: FnOnce(RequestBuilder) -> RequestBuilder,
    {
        if let Some(builder) = self.builder.take() {
            self.builder = Some(f(builder));
            true
        } else {
            false
        }
    }
}

// Create a request builder with specified HTTP method
// method: HTTP method as an integer (1=GET, 2=POST, 3=PUT, 4=DELETE, etc.)
#[no_mangle]
pub extern "C" fn client_new_request_builder(
    client_id: ClientId,
    method: u8,
    url: *const c_char,
) -> *mut RequestBuilderWrapper {
    if client_id == 0 || url.is_null() {
        return ptr::null_mut();
    }

    let clients = CLIENTS.lock().unwrap();
    let client = if let Some(c) = clients.get(&client_id) {
        c
    } else {
        return ptr::null_mut();
    };
    
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => return ptr::null_mut(),
    };

    // Convert method integer to reqwest::Method
    let http_method = match convert_method(method) {
        Some(m) => m,
        None => return ptr::null_mut(),
    };

    let request_builder = client.0.request(http_method, url_str);
    
    Box::into_raw(Box::new(RequestBuilderWrapper {
        builder: Some(request_builder),
        client_id,
        output_file_path: None,
    }))
}

// Free a request builder without sending
#[no_mangle]
pub extern "C" fn request_builder_free(builder_ptr: *mut RequestBuilderWrapper) {
    if !builder_ptr.is_null() {
        unsafe { let _ = Box::from_raw(builder_ptr); }
    }
}

// Set request timeout
#[no_mangle]
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

// Set request headers
#[no_mangle]
pub extern "C" fn request_builder_headers(
    builder_ptr: *mut RequestBuilderWrapper,
    headers_ptr: *mut HeaderMapWrapper,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    
    let headers = if headers_ptr.is_null() {
        HeaderMap::new()
    } else {
        unsafe { (*headers_ptr).0.clone() }
    };
    
    let builder = unsafe { &mut *builder_ptr };
    builder.with_builder(|b| b.headers(headers))
}

// Set request body
#[no_mangle]
pub extern "C" fn request_builder_body(
    builder_ptr: *mut RequestBuilderWrapper,
    body: *const c_char,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    
    let body_str = if !body.is_null() {
        match unsafe { CStr::from_ptr(body).to_str() } {
            Ok(s) => s,
            Err(_) => return false,
        }
    } else {
        ""
    };
    
    unsafe { &mut *builder_ptr }.with_builder(|b| b.body(body_str.to_string()))
}

// Set the output file path for the request, which will cause the response to be streamed to the file.
#[no_mangle]
pub extern "C" fn request_builder_set_output_file(
    builder_ptr: *mut RequestBuilderWrapper,
    file_path: *const c_char,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }

    let builder = unsafe { &mut *builder_ptr };

    if file_path.is_null() {
        builder.output_file_path = None;
        return true;
    }

    let file_path_str = match unsafe { CStr::from_ptr(file_path).to_str() } {
        Ok(s) => s,
        Err(_) => return false,
    };

    if file_path_str.is_empty() {
        builder.output_file_path = None;
    } else {
        builder.output_file_path = Some(file_path_str.to_string());
    }

    true
}

// Send the request and get a request ID.
// If an output file path is set on the builder, the response will be streamed to that file.
// Otherwise, it will be buffered in memory.
#[no_mangle]
pub extern "C" fn request_builder_send(
    builder_ptr: *mut RequestBuilderWrapper,
) -> RequestId {
    if builder_ptr.is_null() {
        return 0;
    }

    // Get the builder
    let builder = unsafe { &mut *builder_ptr };
    let client_id = builder.client_id;
    let output_file_path = builder.output_file_path.clone();

    // Take the builder
    let request_builder = if let Some(b) = builder.builder.take() {
        b
    } else {
        return 0;
    };

    // Create a new request ID
    let request_id = request_builder_new_request_id();

    // Create progress tracking
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

    // Register this request with the client
    client_register_request(client_id, request_id);

    // Use the global runtime to process the request
    GLOBAL_RUNTIME.spawn(async move {
        // Get the future within the Tokio context
        let request_future = request_builder.send();
        async_support::process_request(request_future, progress_info, output_file_path).await;
    });

    request_id
}

// Add a header to the request
#[no_mangle]
pub extern "C" fn request_builder_header(
    builder_ptr: *mut RequestBuilderWrapper,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if builder_ptr.is_null() || key.is_null() || value.is_null() {
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

    unsafe { &mut *builder_ptr }.with_builder(|b| b.header(header_name, header_value))
}

// Set query parameters
#[no_mangle]
pub extern "C" fn request_builder_query(
    builder_ptr: *mut RequestBuilderWrapper,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if builder_ptr.is_null() || key.is_null() || value.is_null() {
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

    unsafe { &mut *builder_ptr }.with_builder(|b| {
        // Create a simple query param
        let query = [(key_str, value_str)];
        b.query(&query)
    })
}

// Set basic authentication
#[no_mangle]
pub extern "C" fn request_builder_basic_auth(
    builder_ptr: *mut RequestBuilderWrapper,
    username: *const c_char,
    password: *const c_char,
) -> bool {
    if builder_ptr.is_null() || username.is_null() {
        return false;
    }

    let username_str = unsafe {
        match CStr::from_ptr(username).to_str() {
            Ok(s) => s,
            Err(_) => return false,
        }
    };

    let password_str = if !password.is_null() {
        match unsafe { CStr::from_ptr(password).to_str() } {
            Ok(s) => Some(s),
            Err(_) => return false,
        }
    } else {
        None
    };

    unsafe { &mut *builder_ptr }.with_builder(|b| {
        if let Some(pwd) = password_str {
            b.basic_auth(username_str, Some(pwd))
        } else {
            b.basic_auth(username_str, Option::<&str>::None)
        }
    })
}

// Set bearer authentication
#[no_mangle]
pub extern "C" fn request_builder_bearer_auth(
    builder_ptr: *mut RequestBuilderWrapper,
    token: *const c_char,
) -> bool {
    if builder_ptr.is_null() || token.is_null() {
        return false;
    }

    let token_str = unsafe {
        match CStr::from_ptr(token).to_str() {
            Ok(s) => s,
            Err(_) => return false,
        }
    };

    unsafe { &mut *builder_ptr }.with_builder(|b| b.bearer_auth(token_str))
}

// Set JSON body (convenience method that sets content-type header too)
#[no_mangle]
pub extern "C" fn request_builder_json(
    builder_ptr: *mut RequestBuilderWrapper,
    json: *const c_char,
) -> bool {
    if builder_ptr.is_null() || json.is_null() {
        return false;
    }

    let json_str = unsafe {
        match CStr::from_ptr(json).to_str() {
            Ok(s) => s,
            Err(_) => return false,
        }
    };

    // Create a serde_json::Value from the JSON string
    let json_value = match serde_json::from_str::<serde_json::Value>(json_str) {
        Ok(v) => v,
        Err(_) => return false,
    };

    unsafe { &mut *builder_ptr }.with_builder(|b| b.json(&json_value))
}

// Set a form parameter
#[no_mangle]
pub extern "C" fn request_builder_form(
    builder_ptr: *mut RequestBuilderWrapper,
    key: *const c_char,
    value: *const c_char,
) -> bool {
    if builder_ptr.is_null() || key.is_null() || value.is_null() {
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

    unsafe { &mut *builder_ptr }.with_builder(|b| {
        // Create a simple form param
        let form = [(key_str, value_str)];
        b.form(&form)
    })
}

// Get the last error message as a C string
#[no_mangle]
pub extern "C" fn get_last_error_message(num_bytes: *mut u32) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }
    
    if let Some(error_message) = take_last_error() {
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

// Set the User-Agent header for the client.
#[no_mangle]
pub extern "C" fn client_builder_user_agent(
    builder_ptr: *mut ClientBuilderWrapper,
    user_agent: *const c_char,
) -> bool {
    if builder_ptr.is_null() || user_agent.is_null() {
        return false;
    }

    let user_agent_str = unsafe {
        match CStr::from_ptr(user_agent).to_str() {
            Ok(s) => s,
            Err(_) => {
                set_last_error("User agent contains invalid UTF-8".to_string());
                return false;
            }
        }
    };
    
    let builder = unsafe {
        std::mem::take(&mut (*builder_ptr).builder)
    };
    // This can fail if the user_agent string is not a valid header value.
    // The error is stored inside the builder and will be returned by `build()`.
    unsafe { &mut *builder_ptr }.builder = builder.user_agent(user_agent_str);
    true
}
