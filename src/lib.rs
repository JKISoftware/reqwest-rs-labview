use libc::c_char;
use std::{
    collections::HashMap,
    ffi::{c_void, CStr, CString},
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
    response_data: Option<String>,
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

// Helper function to convert string to C string pointer
fn string_to_cstring_ptr(s: &str) -> *mut c_char {
    let raw_string = match CString::new(s).unwrap().into_raw() {
        ptr if ptr.is_null() => {
            println!("Unable to allocate memory for string");
            return CString::new("").unwrap().into_raw();
        }
        ptr => ptr,
    };
    raw_string
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
        return string_to_cstring_ptr("Error: Client pointer is null");
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            return string_to_cstring_ptr("Error: Invalid URL string");
        }
    };
    
    let response_text = match runtime.block_on(async {
        let response = match client.get(url_str).send().await {
            Ok(resp) => resp,
            Err(e) => return format!("Error: {}", e),
        };
        
        match response.text().await {
            Ok(text) => text,
            Err(e) => format!("Error: {}", e),
        }
    }) {
        text => text,
    };
    
    // Pass the length of the string back to the caller through the num_bytes pointer
    let return_value_length = response_text.len() as u32;
    unsafe {
        *num_bytes = return_value_length;
    }
    
    string_to_cstring_ptr(&response_text)
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
        return string_to_cstring_ptr("Error: Client pointer is null");
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            return string_to_cstring_ptr("Error: Invalid URL string");
        }
    };
    
    let json_str = match unsafe { CStr::from_ptr(json_body).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid JSON string");
            return string_to_cstring_ptr("Error: Invalid JSON string");
        }
    };
    
    let response_text = match runtime.block_on(async {
        let response = match client.post(url_str)
            .header("Content-Type", "application/json")
            .body(json_str.to_string())
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return format!("Error: {}", e),
        };
        
        match response.text().await {
            Ok(text) => text,
            Err(e) => format!("Error: {}", e),
        }
    }) {
        text => text,
    };
    
    // Pass the length of the string back to the caller through the num_bytes pointer
    let return_value_length = response_text.len() as u32;
    unsafe {
        *num_bytes = return_value_length;
    }
    
    string_to_cstring_ptr(&response_text)
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
        return string_to_cstring_ptr("Error: Client pointer is null");
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            return string_to_cstring_ptr("Error: Invalid URL string");
        }
    };
    
    let json_str = match unsafe { CStr::from_ptr(json_body).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid JSON string");
            return string_to_cstring_ptr("Error: Invalid JSON string");
        }
    };
    
    let response_text = match runtime.block_on(async {
        let response = match client.put(url_str)
            .header("Content-Type", "application/json")
            .body(json_str.to_string())
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return format!("Error: {}", e),
        };
        
        match response.text().await {
            Ok(text) => text,
            Err(e) => format!("Error: {}", e),
        }
    }) {
        text => text,
    };
    
    // Pass the length of the string back to the caller through the num_bytes pointer
    let return_value_length = response_text.len() as u32;
    unsafe {
        *num_bytes = return_value_length;
    }
    
    string_to_cstring_ptr(&response_text)
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
        return string_to_cstring_ptr("Error: Client pointer is null");
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            return string_to_cstring_ptr("Error: Invalid URL string");
        }
    };
    
    let response_text = match runtime.block_on(async {
        let response = match client.delete(url_str).send().await {
            Ok(resp) => resp,
            Err(e) => return format!("Error: {}", e),
        };
        
        match response.text().await {
            Ok(text) => text,
            Err(e) => format!("Error: {}", e),
        }
    }) {
        text => text,
    };
    
    // Pass the length of the string back to the caller through the num_bytes pointer
    let return_value_length = response_text.len() as u32;
    unsafe {
        *num_bytes = return_value_length;
    }
    
    string_to_cstring_ptr(&response_text)
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
        return string_to_cstring_ptr("Error: Client pointer is null");
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            return string_to_cstring_ptr("Error: Invalid URL string");
        }
    };
    
    let form_str = match unsafe { CStr::from_ptr(form_data).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid form data string");
            return string_to_cstring_ptr("Error: Invalid form data string");
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
    
    let response_text = match runtime.block_on(async {
        let response = match client.post(url_str)
            .form(&form_data)
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return format!("Error: {}", e),
        };
        
        match response.text().await {
            Ok(text) => text,
            Err(e) => format!("Error: {}", e),
        }
    }) {
        text => text,
    };
    
    // Pass the length of the string back to the caller through the num_bytes pointer
    let return_value_length = response_text.len() as u32;
    unsafe {
        *num_bytes = return_value_length;
    }
    
    string_to_cstring_ptr(&response_text)
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
        return string_to_cstring_ptr("Error: Client pointer is null");
    }
    
    let (client, runtime) = unsafe { &*(client_ptr as *const (Client, tokio::runtime::Runtime)) };
    let url_str = match unsafe { CStr::from_ptr(url).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid URL string");
            return string_to_cstring_ptr("Error: Invalid URL string");
        }
    };
    
    let header_name_str = match unsafe { CStr::from_ptr(header_name).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid header name string");
            return string_to_cstring_ptr("Error: Invalid header name string");
        }
    };
    
    let header_value_str = match unsafe { CStr::from_ptr(header_value).to_str() } {
        Ok(s) => s,
        Err(_) => {
            println!("Invalid header value string");
            return string_to_cstring_ptr("Error: Invalid header value string");
        }
    };
    
    let response_text = match runtime.block_on(async {
        let response = match client.get(url_str)
            .header(header_name_str, header_value_str)
            .send()
            .await 
        {
            Ok(resp) => resp,
            Err(e) => return format!("Error: {}", e),
        };
        
        match response.text().await {
            Ok(text) => text,
            Err(e) => format!("Error: {}", e),
        }
    }) {
        text => text,
    };
    
    // Pass the length of the string back to the caller through the num_bytes pointer
    let return_value_length = response_text.len() as u32;
    unsafe {
        *num_bytes = return_value_length;
    }
    
    string_to_cstring_ptr(&response_text)
}

// =========== ASYNC API FUNCTIONS ===========

// Start an asynchronous GET request and return a request ID
#[no_mangle]
pub extern "C" fn reqwest_async_get_start(
    client_ptr: *mut c_void,
    url: *const c_char,
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
        let result = client_clone.get(&url_clone).send().await;
        
        match result {
            Ok(resp) => {
                // Update total bytes if available
                if let Some(content_length) = resp.content_length() {
                    let mut progress = progress_info.write().unwrap();
                    progress.total_bytes = Some(content_length);
                }
                
                // Read the response body as text
                match resp.text().await {
                    Ok(text) => {
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Completed;
                        progress.received_bytes = text.len() as u64;
                        progress.response_data = Some(text);
                    },
                    Err(e) => {
                        let mut progress = progress_info.write().unwrap();
                        progress.status = RequestStatus::Error;
                        progress.error = Some(format!("Error reading response: {}", e));
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
                    
                    return string_to_cstring_ptr(data);
                }
            },
            RequestStatus::Error => {
                if let Some(error) = &progress.error {
                    // Set the length of the error message
                    let return_value_length = error.len() as u32;
                    unsafe {
                        *num_bytes = return_value_length;
                    }
                    
                    return string_to_cstring_ptr(error);
                }
            },
            _ => {}
        }
    }
    
    // Request not found or not complete
    unsafe {
        *num_bytes = 0;
    }
    string_to_cstring_ptr("")
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
pub extern "C" fn cstring_free_memory(s: *mut c_char) {
    if s.is_null() {
        return;
    }
    unsafe { let _ = CString::from_raw(s); };
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
        cstring_free_memory(response_ptr);
        
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
        cstring_free_memory(response_ptr);
        
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
        let request_id = reqwest_async_get_start(client_ptr, url.as_ptr());
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
        cstring_free_memory(response_ptr);
        
        // Clean up the request
        reqwest_async_cleanup(request_id);
        
        // Close the client
        reqwest_client_close(client_ptr);
        
        // Verify the response contains expected data
        assert!(response_str.contains("httpbin.org"), "Response should contain 'httpbin.org' but was: {}", response_str);
        assert!(num_bytes > 0, "Response should have bytes");
    }
} 