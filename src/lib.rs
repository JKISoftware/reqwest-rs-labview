use libc::c_char;
use reqwest::{
    header::{HeaderMap, HeaderName, HeaderValue},
    Client, ClientBuilder, StatusCode,
};
use std::{
    collections::{HashMap, HashSet},
    ffi::{c_void, CStr},
    ptr,
    sync::{Arc, Mutex, RwLock},
    time::Duration,
};

mod async_support;

// Types to track ongoing requests
type RequestId = u64;
type ClientId = usize;
type ProgressInfo = Arc<RwLock<RequestProgress>>;

// Global runtime and request tracker
lazy_static::lazy_static! {
    static ref REQUEST_TRACKER: Mutex<HashMap<RequestId, ProgressInfo>> = Mutex::new(HashMap::new());
    static ref NEXT_REQUEST_ID: Mutex<RequestId> = Mutex::new(1);
    static ref CLIENT_REQUESTS: Mutex<HashMap<ClientId, HashSet<RequestId>>> = Mutex::new(HashMap::new());
    static ref GLOBAL_RUNTIME: tokio::runtime::Runtime = tokio::runtime::Builder::new_multi_thread()
            .enable_all()
            .build()
            .expect("Failed to create global Tokio runtime");
}

// Helper function to get next request ID
fn next_request_id() -> RequestId {
    let mut id = NEXT_REQUEST_ID.lock().unwrap();
    let current = *id;
    *id += 1;
    current
}

// Helper function to register a request with a client
fn register_request(client_id: ClientId, request_id: RequestId) {
    let mut client_requests = CLIENT_REQUESTS.lock().unwrap();
    client_requests.entry(client_id).or_insert_with(HashSet::new).insert(request_id);
}

// Helper function to mark all requests for a client as cancelled
fn cancel_client_requests(client_id: ClientId) {
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

// Wrapper for the reqwest Client
pub struct ReqwestClient(Client);

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
        std::mem::take(&mut (*builder_ptr).0)
    };
    unsafe { &mut *builder_ptr }.0 = builder.default_headers(headers);
    true
}

// Set timeouts for the client
#[no_mangle]
pub extern "C" fn client_builder_timeout(
    builder_ptr: *mut ReqwestClientBuilder,
    connect_timeout_secs: u64,
    timeout_secs: u64,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).0)
    };
    unsafe { &mut *builder_ptr }.0 = builder
        .connect_timeout(Duration::from_secs(connect_timeout_secs))
        .timeout(Duration::from_secs(timeout_secs));
    true
}

// Set whether to accept invalid certificates
#[no_mangle]
pub extern "C" fn client_builder_danger_accept_invalid_certs(
    builder_ptr: *mut ReqwestClientBuilder,
    accept: bool,
) -> bool {
    if builder_ptr.is_null() {
        return false;
    }
    let builder = unsafe {
        // an unsafe block is required to dereference the raw pointer
        std::mem::take(&mut (*builder_ptr).0)
    };
    unsafe { &mut *builder_ptr }.0 = builder.danger_accept_invalid_certs(accept);
    true
}

// Build the client from the builder
#[no_mangle]
pub extern "C" fn client_builder_build(
    builder_ptr: *mut ReqwestClientBuilder,
) -> *mut c_void {
    if builder_ptr.is_null() {
        return ptr::null_mut();
    }

    let builder = unsafe { Box::from_raw(builder_ptr) };

    // Use the global runtime to build the client
    let client = GLOBAL_RUNTIME.block_on(async {
        match builder.0.build() {
            Ok(c) => c,
            Err(e) => {
                println!("Failed to build client: {}", e);
                return Client::builder().build().unwrap(); // Fallback to default client as a last resort
            }
        }
    });

    let client_wrapper = Box::new(ReqwestClient(client));
    let client_ptr = Box::into_raw(client_wrapper) as *mut c_void;
    
    // Initialize an empty set of request IDs for this client
    let client_id = client_ptr as usize;
    CLIENT_REQUESTS.lock().unwrap().insert(client_id, HashSet::new());
    
    client_ptr
}

// Close a reqwest client and free the memory
#[no_mangle]
pub extern "C" fn client_close(client_ptr: *mut c_void) {
    if client_ptr.is_null() {
        return;
    }

    let client_id = client_ptr as usize;
    
    // Cancel all pending requests for this client
    cancel_client_requests(client_id);
    
    // Wait for any pending operations to complete
    GLOBAL_RUNTIME.block_on(async {
        // Allow some time for cancellation to take effect
        tokio::time::sleep(Duration::from_millis(100)).await;
    });
    
    // Now it's safe to drop the client
    let _ = unsafe { Box::from_raw(client_ptr as *mut ReqwestClient) };
    
    // Yield to ensure proper cleanup
    GLOBAL_RUNTIME.block_on(async {
        tokio::task::yield_now().await;
    });
}

// Start an asynchronous GET request and return a request ID
#[no_mangle]
pub extern "C" fn client_start_get_request(
    client_ptr: *mut c_void,
    url: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
    file_path: *const c_char,
) -> RequestId {
    if client_ptr.is_null() {
        return 0;
    }

    let client = unsafe { &*(client_ptr as *const ReqwestClient) };
    let client_id = client_ptr as usize;
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
    
    // Register this request with the client
    register_request(client_id, request_id);

    // Clone the URL for the async task
    let url_clone = url_str.clone();
    let client_clone = client.0.clone();

    // Process the request inside the global runtime
    GLOBAL_RUNTIME.spawn(async move {
        let request_future = client_clone.get(&url_clone).headers(request_headers).send();
        async_support::process_request(request_future, progress_info, file_path_str).await;
    });

    request_id
}

// Start an asynchronous DELETE request and return a request ID
#[no_mangle]
pub extern "C" fn client_start_delete_request(
    client_ptr: *mut c_void,
    url: *const c_char,
    body: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
) -> RequestId {
    start_request_with_body(
        client_ptr,
        url,
        body,
        headers_ptr,
        reqwest::Method::DELETE,
    )
}

// A generic request function for methods with bodies
fn start_request_with_body(
    client_ptr: *mut c_void,
    url: *const c_char,
    body: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
    method: reqwest::Method,
) -> RequestId {
    if client_ptr.is_null() || url.is_null() {
        return 0;
    }

    let client = unsafe { &*(client_ptr as *const ReqwestClient) };
    let client_id = client_ptr as usize;
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s.to_string(),
        Err(_) => return 0,
    };

    let body_str = if !body.is_null() {
        match unsafe { CStr::from_ptr(body).to_str() } {
            Ok(s) => s.to_string(),
            Err(_) => return 0,
        }
    } else {
        String::new()
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

    register_request(client_id, request_id);

    let url_clone = url_str.clone();
    let client_clone = client.0.clone();

    GLOBAL_RUNTIME.spawn(async move {
        let request_future = client_clone
            .request(method, &url_clone)
            .headers(request_headers)
            .body(body_str)
            .send();
        async_support::process_request(request_future, progress_info, None).await;
    });

    request_id
}

// Start an asynchronous POST request and return a request ID
#[no_mangle]
pub extern "C" fn client_start_post_request(
    client_ptr: *mut c_void,
    url: *const c_char,
    body: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
) -> RequestId {
    start_request_with_body(client_ptr, url, body, headers_ptr, reqwest::Method::POST)
}

// Start an asynchronous PUT request and return a request ID
#[no_mangle]
pub extern "C" fn client_start_put_request(
    client_ptr: *mut c_void,
    url: *const c_char,
    body: *const c_char,
    headers_ptr: *mut ReqwestHeaderMap,
) -> RequestId {
    start_request_with_body(client_ptr, url, body, headers_ptr, reqwest::Method::PUT)
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
pub extern "C" fn request_read_response_headers(request_id: RequestId) -> *mut ReqwestHeaderMap {
    // Get the response info
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        if let Some(ref response) = progress.final_response {
            return Box::into_raw(Box::new(ReqwestHeaderMap(response.headers.clone())));
        }
    }
    
    ptr::null_mut() // Return null if request not found or no response yet
}

// Get the error message directly as a string without exposing the response object
#[no_mangle]
pub extern "C" fn request_read_response_error_string(
    request_id: RequestId,
    num_bytes: *mut u32,
) -> *mut c_char {
    if num_bytes.is_null() {
        return ptr::null_mut();
    }
    
    // Get the response info
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
