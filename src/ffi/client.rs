use crate::{
    globals::{client_cancel_requests, CLIENTS, CLIENT_REQUESTS, GLOBAL_RUNTIME, NEXT_CLIENT_ID},
    helpers::convert_method,
    types::{ClientBuilderWrapper, ClientId, ClientWrapper, RequestBuilderWrapper},
};
use libc::c_char;
use std::{ffi::CStr, collections::HashSet, ptr, sync::atomic::Ordering, time::Duration};

/// Build the client from the builder
#[unsafe(no_mangle)]
pub extern "C" fn client_builder_create_client_and_start(builder_ptr: *mut ClientBuilderWrapper) -> ClientId {
    if builder_ptr.is_null() {
        return 0;
    }

    // Don't take ownership yet, just borrow mutably.
    let builder_wrapper = unsafe { &mut *builder_ptr };

    // Take the internal builder for building.
    // We need to replace it with a default one because `build()` consumes it.
    let builder_to_build = std::mem::replace(&mut builder_wrapper.builder, reqwest::Client::builder());

    match builder_to_build.build() {
        Ok(client) => {
            // On success, the caller is still responsible for destroying the builder.
            let client_wrapper = ClientWrapper(client);
            let client_id = NEXT_CLIENT_ID.fetch_add(1, Ordering::SeqCst) as ClientId;

            let mut clients = CLIENTS.lock().unwrap();
            clients.insert(client_id, client_wrapper);

            // Initialize an empty set of request IDs for this client
            CLIENT_REQUESTS
                .lock()
                .unwrap()
                .insert(client_id, HashSet::new());

            client_id
        }
        Err(e) => {
            // On failure, store the error in the wrapper. The caller is responsible
            // for destroying the builder.
            builder_wrapper.error_message = Some(format!("Failed to build client: {}", e));
            0 // Return 0 to indicate failure
        }
    }
}

/// Destroy a reqwest client and destroy the memory
#[unsafe(no_mangle)]
pub extern "C" fn client_destroy(client_id: ClientId) {
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

    // Yield to ensure proper destroy
    GLOBAL_RUNTIME.block_on(async {
        tokio::task::yield_now().await;
    });
}

/// Create a request builder with specified HTTP method
/// method: HTTP method as an integer (1=GET, 2=POST, 3=PUT, 4=DELETE, etc.)
#[unsafe(no_mangle)]
pub extern "C" fn client_create_request_builder(
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
        error_message: None,
    }))
}

/// Cancel all requests for a given client
#[unsafe(no_mangle)]
pub extern "C" fn client_cancel_all_requests(client_id: ClientId) {
    client_cancel_requests(client_id);
} 