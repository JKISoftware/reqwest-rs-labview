use std::{
    collections::{HashMap, HashSet},
    sync::Mutex,
};
use crate::types::{ClientWrapper, ProgressInfo, RequestId, ClientId, RequestStatus};

// Global runtime and request tracker
lazy_static::lazy_static! {
    pub static ref REQUEST_TRACKER: Mutex<HashMap<RequestId, ProgressInfo>> = Mutex::new(HashMap::new());
    pub static ref NEXT_REQUEST_ID: Mutex<RequestId> = Mutex::new(1);
    pub static ref CLIENTS: Mutex<HashMap<ClientId, ClientWrapper>> = Mutex::new(HashMap::new());
    pub static ref NEXT_CLIENT_ID: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(1);
    pub static ref CLIENT_REQUESTS: Mutex<HashMap<ClientId, HashSet<RequestId>>> = Mutex::new(HashMap::new());
    pub static ref GLOBAL_RUNTIME: tokio::runtime::Runtime = tokio::runtime::Builder::new_multi_thread()
            .enable_all()
            .build()
            .expect("Failed to create global Tokio runtime");
}

// Helper function to create a new request ID
pub fn request_builder_create_request_id() -> RequestId {
    let mut id = NEXT_REQUEST_ID.lock().unwrap();
    let current = *id;
    *id += 1;
    current
}

// Helper function to register a request with a client
pub fn client_register_request(client_id: ClientId, request_id: RequestId) {
    let mut client_requests = CLIENT_REQUESTS.lock().unwrap();
    client_requests
        .entry(client_id)
        .or_insert_with(HashSet::new)
        .insert(request_id);
}

// Helper function to mark all requests for a client as cancelled
pub fn client_cancel_requests(client_id: ClientId) {
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