use libc::c_char;
use std::{
    collections::HashMap,
    ffi::{c_void, CStr},
    io::Write,
    ptr,
    sync::{Arc, Mutex, RwLock},
};
use reqwest::Client;

// Types to track ongoing requests
type RequestId = u64;
type ProgressInfo = Arc<RwLock<RequestProgress>>;

// Global request tracker
lazy_static::lazy_static! {
    static ref REQUEST_TRACKER: Mutex<HashMap<RequestId, ProgressInfo>> = Mutex::new(HashMap::new());
    static ref NEXT_REQUEST_ID: Mutex<RequestId> = Mutex::new(1);
}

// Struct to track request progress
struct RequestProgress {
    status: RequestStatus,
    total_bytes: Option<u64>,
    received_bytes: u64,
    response_data: Option<Vec<u8>>,
    error: Option<String>,
}

// Enum to track request status
#[derive(PartialEq)]
enum RequestStatus {
    InProgress,
    Completed,
    Error,
    Cancelled,
}

// Helper function to copy bytes to a C-compatible buffer.
// The caller is responsible for freeing the memory with `reqwest_free_memory`.
fn bytes_to_c_ptr(data: &[u8]) -> *mut c_char {
    let len = data.len();
    unsafe {
        let buffer = libc::malloc(len + 1); // +1 for null terminator for strings
        if buffer.is_null() {
            // In case of allocation failure, we can't do much.
            // Returning a pointer to a static string is unsafe because the caller will try to free it.
            // Returning null is the safest option.
            return ptr::null_mut();
        }
        ptr::copy_nonoverlapping(data.as_ptr(), buffer as *mut u8, len);
        // Add null terminator for safety with C string functions
        *(buffer as *mut u8).add(len) = 0;
        buffer as *mut c_char
    }
}

// Helper function to get next request ID
fn next_request_id() -> RequestId {
    let mut id = NEXT_REQUEST_ID.lock().unwrap();
    let current = *id;
    *id += 1;
    current
}

// Create a new reqwest client and return a pointer to it
#[no_mangle]
pub extern "C" fn reqwest_client_new() -> *mut c_void {
    let runtime = match tokio::runtime::Runtime::new() {
        Ok(rt) => rt,
        Err(e) => {
            println!("Failed to create Tokio runtime: {}", e);
            return ptr::null_mut();
        }
    };

    let client = Client::new();
    
    // Box both the client and runtime together so we can keep the runtime alive
    let client_with_runtime = Box::new((client, runtime));
    
    Box::into_raw(client_with_runtime) as *mut c_void
}

// Close a reqwest client and free the memory
#[no_mangle]
pub extern "C" fn reqwest_client_close(client_ptr: *mut c_void) {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        return;
    }
    
    unsafe {
        let _ = Box::from_raw(client_ptr as *mut (Client, tokio::runtime::Runtime));
    }
}

// Make a GET request and return the response body as a string
#[no_mangle]
pub extern "C" fn reqwest_get(
    client_ptr: *mut c_void,
    url: *const c_char,
    num_bytes: *mut u32,
) -> *mut c_char {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        let err_msg = b"Error: Client pointer is null";
        unsafe { *num_bytes = err_msg.len() as u32; }
        return bytes_to_c_ptr(err_msg);
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            let err_msg = b"Error: Invalid URL string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let response_result = runtime.block_on(async {
        let response = match client.get(url_str).send().await {
            Ok(resp) => resp,
            Err(e) => return Err(format!("Error: {}", e)),
        };
        
        match response.bytes().await {
            Ok(bytes) => Ok(bytes.to_vec()),
            Err(e) => Err(format!("Error: {}", e)),
        }
    });

    match response_result {
        Ok(data) => {
            unsafe { *num_bytes = data.len() as u32; }
            bytes_to_c_ptr(&data)
        }
        Err(e) => {
            unsafe { *num_bytes = e.len() as u32; }
            bytes_to_c_ptr(e.as_bytes())
        }
    }
}

// Make a POST request with a JSON body and return the response body as a string
#[no_mangle]
pub extern "C" fn reqwest_post_json(
    client_ptr: *mut c_void,
    url: *const c_char,
    json_body: *const c_char,
    num_bytes: *mut u32,
) -> *mut c_char {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        let err_msg = b"Error: Client pointer is null";
        unsafe { *num_bytes = err_msg.len() as u32; }
        return bytes_to_c_ptr(err_msg);
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            let err_msg = b"Error: Invalid URL string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let json_str = match unsafe { CStr::from_ptr(json_body).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid JSON string");
            let err_msg = b"Error: Invalid JSON string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let response_result = runtime.block_on(async {
        let response = match client.post(url_str)
            .header("Content-Type", "application/json")
            .body(json_str.to_string())
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return Err(format!("Error: {}", e)),
        };
        
        match response.bytes().await {
            Ok(bytes) => Ok(bytes.to_vec()),
            Err(e) => Err(format!("Error: {}", e)),
        }
    });

    match response_result {
        Ok(data) => {
            unsafe { *num_bytes = data.len() as u32; }
            bytes_to_c_ptr(&data)
        }
        Err(e) => {
            unsafe { *num_bytes = e.len() as u32; }
            bytes_to_c_ptr(e.as_bytes())
        }
    }
}

// Make a PUT request with a JSON body and return the response body as a string
#[no_mangle]
pub extern "C" fn reqwest_put_json(
    client_ptr: *mut c_void,
    url: *const c_char,
    json_body: *const c_char,
    num_bytes: *mut u32,
) -> *mut c_char {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        let err_msg = b"Error: Client pointer is null";
        unsafe { *num_bytes = err_msg.len() as u32; }
        return bytes_to_c_ptr(err_msg);
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            let err_msg = b"Error: Invalid URL string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let json_str = match unsafe { CStr::from_ptr(json_body).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid JSON string");
            let err_msg = b"Error: Invalid JSON string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let response_result = runtime.block_on(async {
        let response = match client.put(url_str)
            .header("Content-Type", "application/json")
            .body(json_str.to_string())
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return Err(format!("Error: {}", e)),
        };
        
        match response.bytes().await {
            Ok(bytes) => Ok(bytes.to_vec()),
            Err(e) => Err(format!("Error: {}", e)),
        }
    });
    
    match response_result {
        Ok(data) => {
            unsafe { *num_bytes = data.len() as u32; }
            bytes_to_c_ptr(&data)
        }
        Err(e) => {
            unsafe { *num_bytes = e.len() as u32; }
            bytes_to_c_ptr(e.as_bytes())
        }
    }
}

// Make a DELETE request and return the response body as a string
#[no_mangle]
pub extern "C" fn reqwest_delete(
    client_ptr: *mut c_void,
    url: *const c_char,
    num_bytes: *mut u32,
) -> *mut c_char {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        let err_msg = b"Error: Client pointer is null";
        unsafe { *num_bytes = err_msg.len() as u32; }
        return bytes_to_c_ptr(err_msg);
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            let err_msg = b"Error: Invalid URL string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let response_result = runtime.block_on(async {
        let response = match client.delete(url_str).send().await {
            Ok(resp) => resp,
            Err(e) => return Err(format!("Error: {}", e)),
        };
        
        match response.bytes().await {
            Ok(bytes) => Ok(bytes.to_vec()),
            Err(e) => Err(format!("Error: {}", e)),
        }
    });
    
    match response_result {
        Ok(data) => {
            unsafe { *num_bytes = data.len() as u32; }
            bytes_to_c_ptr(&data)
        }
        Err(e) => {
            unsafe { *num_bytes = e.len() as u32; }
            bytes_to_c_ptr(e.as_bytes())
        }
    }
}

// Make a POST request with a form body and return the response body as a string
#[no_mangle]
pub extern "C" fn reqwest_post_form(
    client_ptr: *mut c_void,
    url: *const c_char,
    form_data: *const c_char,
    num_bytes: *mut u32,
) -> *mut c_char {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        let err_msg = b"Error: Client pointer is null";
        unsafe { *num_bytes = err_msg.len() as u32; }
        return bytes_to_c_ptr(err_msg);
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            let err_msg = b"Error: Invalid URL string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let form_str = match unsafe { CStr::from_ptr(form_data).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid form data string");
            let err_msg = b"Error: Invalid form data string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    // Form data is expected to be in the format "key1=value1&key2=value2"
    let form_data: Vec<(String, String)> = form_str
        .split('&')
        .filter_map(|pair| {
            let mut parts = pair.splitn(2, '=');
            let key = parts.next()?.to_string();
            let value = parts.next()?.to_string();
            Some((key, value))
        })
        .collect();
    
    let response_result = runtime.block_on(async {
        let response = match client.post(url_str)
            .form(&form_data)
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return Err(format!("Error: {}", e)),
        };
        
        match response.bytes().await {
            Ok(bytes) => Ok(bytes.to_vec()),
            Err(e) => Err(format!("Error: {}", e)),
        }
    });
    
    match response_result {
        Ok(data) => {
            unsafe { *num_bytes = data.len() as u32; }
            bytes_to_c_ptr(&data)
        }
        Err(e) => {
            unsafe { *num_bytes = e.len() as u32; }
            bytes_to_c_ptr(e.as_bytes())
        }
    }
}

// Get HTTP status code from a response
#[no_mangle]
pub extern "C" fn reqwest_get_status(
    client_ptr: *mut c_void,
    url: *const c_char,
) -> i32 {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        return -1;
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            return -1;
        }
    };
    
    let status_code = match runtime.block_on(async {
        match client.get(url_str).send().await {
            Ok(resp) => resp.status().as_u16() as i32,
            Err(_) => -1,
        }
    }) {
        code => code,
    };
    
    status_code
}

// Add a custom header to the client
#[no_mangle]
pub extern "C" fn reqwest_get_with_header(
    client_ptr: *mut c_void,
    url: *const c_char,
    header_name: *const c_char,
    header_value: *const c_char,
    num_bytes: *mut u32,
) -> *mut c_char {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        let err_msg = b"Error: Client pointer is null";
        unsafe { *num_bytes = err_msg.len() as u32; }
        return bytes_to_c_ptr(err_msg);
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            let err_msg = b"Error: Invalid URL string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let header_name_str = match unsafe { CStr::from_ptr(header_name).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid header name string");
            let err_msg = b"Error: Invalid header name string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let header_value_str = match unsafe { CStr::from_ptr(header_value).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid header value string");
            let err_msg = b"Error: Invalid header value string";
            unsafe { *num_bytes = err_msg.len() as u32; }
            return bytes_to_c_ptr(err_msg);
        }
    };
    
    let response_result = runtime.block_on(async {
        let response = match client.get(url_str)
            .header(header_name_str, header_value_str)
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return Err(format!("Error: {}", e)),
        };
        
        match response.bytes().await {
            Ok(bytes) => Ok(bytes.to_vec()),
            Err(e) => Err(format!("Error: {}", e)),
        }
    });
    
    match response_result {
        Ok(data) => {
            unsafe { *num_bytes = data.len() as u32; }
            bytes_to_c_ptr(&data)
        }
        Err(e) => {
            unsafe { *num_bytes = e.len() as u32; }
            bytes_to_c_ptr(e.as_bytes())
        }
    }
}

// =========== ASYNC API FUNCTIONS ===========

// Start an asynchronous GET request and return a request ID
#[no_mangle]
pub extern "C" fn reqwest_async_get_start(
    client_ptr: *mut c_void,
    url: *const c_char,
    file_path: *const c_char,
) -> RequestId {
    if client_ptr.is_null() {
        println!("Client pointer is null");
        return 0;
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
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
    
    // Create a new request ID
    let request_id = next_request_id();
    
    // Create a progress info struct
    let progress_info = Arc::new(RwLock::new(RequestProgress {
        status: RequestStatus::InProgress,
        total_bytes: None,
        received_bytes: 0,
        response_data: None,
        error: None,
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
    runtime.spawn(async move {
        let mut file = if let Some(path) = &file_path_str {
            match std::fs::File::create(path) {
                Ok(f) => Some(f),
                Err(e) => {
                    let mut progress = progress_info.write().unwrap();
                    progress.status = RequestStatus::Error;
                    progress.error = Some(format!("Failed to create file: {}", e));
                    return;
                }
            }
        } else {
            None
        };

        let result = client_clone.get(&url_clone).send().await;
        
        match result {
            Ok(mut resp) => {
                // Update total bytes if available
                let total_size = resp.content_length();
                {
                    let mut progress = progress_info.write().unwrap();
                    progress.total_bytes = total_size;
                }
                
                let mut received_data = if file.is_none() {
                    Some(Vec::with_capacity(total_size.unwrap_or(0) as usize))
                } else {
                    None
                };

                loop {
                    // Check for cancellation before awaiting the next chunk
                    if progress_info.read().unwrap().status == RequestStatus::Cancelled {
                        return;
                    }

                    match resp.chunk().await {
                        Ok(Some(chunk)) => {
                            if let Some(f) = &mut file {
                                if let Err(e) = f.write_all(&chunk) {
                                    let mut progress = progress_info.write().unwrap();
                                    progress.status = RequestStatus::Error;
                                    progress.error =
                                        Some(format!("Error writing to file: {}", e));
                                    break;
                                }
                            } else if let Some(data) = &mut received_data {
                                data.extend_from_slice(&chunk);
                            }

                            {
                                let mut progress = progress_info.write().unwrap();
                                // In case of cancellation, we stop updating progress.
                                if progress.status == RequestStatus::InProgress {
                                    progress.received_bytes += chunk.len() as u64;
                                }
                            }
                        }
                        Ok(None) => {
                            // Download complete
                            let mut progress = progress_info.write().unwrap();
                            if progress.status == RequestStatus::InProgress {
                                progress.status = RequestStatus::Completed;
                                progress.response_data = received_data;
                            }
                            break;
                        }
                        Err(e) => {
                            // Error during download
                            let mut progress = progress_info.write().unwrap();
                            progress.status = RequestStatus::Error;
                            progress.error = Some(format!("Error reading response: {}", e));
                            break;
                        }
                    }
                }
            },
            Err(e) => {
                // Update error status
                let mut progress = progress_info.write().unwrap();
                progress.status = RequestStatus::Error;
                progress.error = Some(format!("Error sending request: {}", e));
            }
        }
    });
    
    request_id
}

// Check if an async request is complete
#[no_mangle]
pub extern "C" fn reqwest_async_is_complete(request_id: RequestId) -> bool {
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        match progress.status {
            RequestStatus::Completed | RequestStatus::Error | RequestStatus::Cancelled => true,
            RequestStatus::InProgress => false,
        }
    } else {
        // Request ID not found
        true
    }
}

// Get the progress of an async request (0-100)
#[no_mangle]
pub extern "C" fn reqwest_async_get_progress(request_id: RequestId) -> i32 {
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        
        // If we have total bytes, calculate percentage
        if let Some(total) = progress.total_bytes {
            if total > 0 {
                return ((progress.received_bytes as f64 / total as f64) * 100.0) as i32;
            }
        }
        
        // If request is complete but we didn't have total bytes
        match progress.status {
            RequestStatus::Completed => 100,
            RequestStatus::Error | RequestStatus::Cancelled => -1,
            RequestStatus::InProgress => 0,
        }
    } else {
        // Request ID not found
        -1
    }
}

// Get the total bytes of an async request. Returns 0 if not available.
#[no_mangle]
pub extern "C" fn reqwest_async_get_total_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.total_bytes.unwrap_or(0)
    } else {
        0
    }
}

// Get the received bytes of an async request.
#[no_mangle]
pub extern "C" fn reqwest_async_get_received_bytes(request_id: RequestId) -> u64 {
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        progress.received_bytes
    } else {
        0
    }
}

// Get the response data from an async request
#[no_mangle]
pub extern "C" fn reqwest_async_get_response(
    request_id: RequestId,
    num_bytes: *mut u32,
) -> *mut c_char {
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let progress = progress_info.read().unwrap();
        
        match progress.status {
            RequestStatus::Completed => {
                if let Some(data) = &progress.response_data {
                    // Set the length of the response
                    let return_value_length = data.len() as u32;
                    unsafe {
                        *num_bytes = return_value_length;
                    }
                    
                    return bytes_to_c_ptr(data);
                }
            },
            RequestStatus::Error => {
                if let Some(error) = &progress.error {
                    // Set the length of the error message
                    let return_value_length = error.len() as u32;
                    unsafe {
                        *num_bytes = return_value_length;
                    }
                    
                    return bytes_to_c_ptr(error.as_bytes());
                }
            },
            _ => {}
        }
    }
    
    // Request not found or not complete
    unsafe {
        *num_bytes = 0;
    }
    bytes_to_c_ptr(b"")
}

// Cancel an async request
#[no_mangle]
pub extern "C" fn reqwest_async_cancel(request_id: RequestId) -> bool {
    let tracker = REQUEST_TRACKER.lock().unwrap();
    
    if let Some(progress_info) = tracker.get(&request_id) {
        let mut progress = progress_info.write().unwrap();
        
        // Only cancel if it's still in progress
        if progress.status == RequestStatus::InProgress {
            progress.status = RequestStatus::Cancelled;
            return true;
        }
    }
    
    false
}

// Clean up an async request and remove it from the tracker
#[no_mangle]
pub extern "C" fn reqwest_async_cleanup(request_id: RequestId) {
    let mut tracker = REQUEST_TRACKER.lock().unwrap();
    tracker.remove(&request_id);
}

// exported function that frees the memory allocated for a string
// this *must* be called for every string returned from a function in this library
#[no_mangle]
pub extern "C" fn reqwest_free_memory(s: *mut c_char) {
    if s.is_null() {
        return;
    }
    unsafe { libc::free(s as *mut c_void); };
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::ffi::CString;
    
    // Test creating a client and making a GET request
    #[test]
    fn test_reqwest_get() {
        // Create a client
        let client_ptr = reqwest_client_new();
        assert!(!client_ptr.is_null());
        
        // Create a URL string
        let url = CString::new("https://httpbin.org/get").unwrap();
        
        // Make a GET request
        let mut num_bytes: u32 = 0;
        let response_ptr = reqwest_get(
            client_ptr,
            url.as_ptr(),
            &mut num_bytes as *mut u32,
        );
        
        // Convert response to Rust string
        let response_str = unsafe { CStr::from_ptr(response_ptr).to_string_lossy().into_owned() };
        
        // Free the response string
        reqwest_free_memory(response_ptr);
        
        // Close the client
        reqwest_client_close(client_ptr);
        
        // Verify the response contains expected data
        assert!(response_str.contains("httpbin.org"));
        assert!(num_bytes > 0);
    }
    
    // Test POST with JSON body
    #[test]
    fn test_reqwest_post_json() {
        // Create a client
        let client_ptr = reqwest_client_new();
        assert!(!client_ptr.is_null());
        
        // Create a URL string and JSON body
        let url = CString::new("https://httpbin.org/post").unwrap();
        let json_body = CString::new(r#"{"name":"test","value":123}"#).unwrap();
        
        // Make a POST request
        let mut num_bytes: u32 = 0;
        let response_ptr = reqwest_post_json(
            client_ptr,
            url.as_ptr(),
            json_body.as_ptr(),
            &mut num_bytes as *mut u32,
        );
        
        // Convert response to Rust string
        let response_str = unsafe { CStr::from_ptr(response_ptr).to_string_lossy().into_owned() };
        
        // Free the response string
        reqwest_free_memory(response_ptr);
        
        // Close the client
        reqwest_client_close(client_ptr);
        
        // Verify the response contains expected data
        assert!(response_str.contains("test"));
        assert!(response_str.contains("123"));
        assert!(num_bytes > 0);
    }
    
    // Test async GET
    #[test]
    fn test_reqwest_async_get() {
        // Create a client
        let client_ptr = reqwest_client_new();
        assert!(!client_ptr.is_null());
        
        // Create a URL string
        let url = CString::new("https://httpbin.org/get").unwrap();
        
        // Start an async GET request
        let request_id = reqwest_async_get_start(client_ptr, url.as_ptr(), ptr::null());
        assert!(request_id > 0);
        
        // Wait for the request to complete (with timeout)
        let start_time = std::time::Instant::now();
        let mut completed = false;
        
        while !completed && start_time.elapsed().as_secs() < 10 {
            completed = reqwest_async_is_complete(request_id);
            if !completed {
                std::thread::sleep(std::time::Duration::from_millis(100));
            }
        }
        
        assert!(completed, "Request should complete within timeout");
        
        // Get the response data
        let mut num_bytes: u32 = 0;
        let response_ptr = reqwest_async_get_response(request_id, &mut num_bytes as *mut u32);
        
        // Convert response to Rust string
        let response_str = unsafe { CStr::from_ptr(response_ptr).to_string_lossy().into_owned() };
        
        // Free the response string
        reqwest_free_memory(response_ptr);
        
        // Clean up the request
        reqwest_async_cleanup(request_id);
        
        // Close the client
        reqwest_client_close(client_ptr);
        
        // Verify the response contains expected data
        assert!(response_str.contains("httpbin.org"), "Response should contain 'httpbin.org' but was: {}", response_str);
        assert!(num_bytes > 0, "Response should have bytes");
    }

    // Test async GET to file
    #[test]
    fn test_reqwest_async_get_to_file() {
        // Create a client
        let client_ptr = reqwest_client_new();
        assert!(!client_ptr.is_null());

        // Create a URL string
        let url = CString::new("https://httpbin.org/get").unwrap();

        // Define a file path for the download
        let file_path = "test_download.json";
        let file_path_cstr = CString::new(file_path).unwrap();

        // Start an async GET request to file
        let request_id =
            reqwest_async_get_start(client_ptr, url.as_ptr(), file_path_cstr.as_ptr());
        assert!(request_id > 0);

        // Wait for the request to complete (with timeout)
        let start_time = std::time::Instant::now();
        let mut completed = false;

        while !completed && start_time.elapsed().as_secs() < 10 {
            completed = reqwest_async_is_complete(request_id);
            if !completed {
                std::thread::sleep(std::time::Duration::from_millis(100));
            }
        }

        assert!(completed, "Request should complete within timeout");

        // Get the response data, which should be empty
        let mut num_bytes: u32 = 0;
        let response_ptr = reqwest_async_get_response(request_id, &mut num_bytes as *mut u32);
        let response_str = unsafe { CStr::from_ptr(response_ptr).to_string_lossy().into_owned() };
        reqwest_free_memory(response_ptr);

        assert_eq!(num_bytes, 0, "num_bytes should be 0");
        assert!(
            response_str.is_empty(),
            "Response string should be empty"
        );

        // Verify the file was created and has content
        let file_content =
            std::fs::read_to_string(file_path).expect("Should have been able to read the file");
        assert!(file_content.contains("httpbin.org"));

        // Clean up the request
        reqwest_async_cleanup(request_id);

        // Clean up the downloaded file
        std::fs::remove_file(file_path).unwrap();

        // Close the client
        reqwest_client_close(client_ptr);
    }

    // Test binary file download
    #[test]
    fn test_reqwest_get_binary() {
        // Create a client
        let client_ptr = reqwest_client_new();
        assert!(!client_ptr.is_null());
        
        // Create a URL string to a binary file
        let url = CString::new("https://httpbin.org/image/png").unwrap();
        
        // Make a GET request
        let mut num_bytes: u32 = 0;
        let response_ptr = reqwest_get(
            client_ptr,
            url.as_ptr(),
            &mut num_bytes as *mut u32,
        );

        assert!(!response_ptr.is_null(), "Response pointer should not be null");
        
        // PNG file signature
        let png_signature: [u8; 8] = [137, 80, 78, 71, 13, 10, 26, 10];
        let response_slice = unsafe { std::slice::from_raw_parts(response_ptr as *const u8, num_bytes as usize) };
        
        // Verify the response starts with PNG signature
        assert!(num_bytes > 8, "Response should be larger than 8 bytes for a PNG file");
        assert_eq!(&response_slice[..8], &png_signature, "Response should be a PNG file");

        // Free the response string
        reqwest_free_memory(response_ptr);
        
        // Close the client
        reqwest_client_close(client_ptr);
    }
} 