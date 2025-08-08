use reqwest::{Client, RequestBuilder, StatusCode, header::HeaderMap};
use std::sync::{Arc, RwLock};

/// Type aliases for IDs
pub type ClientId = usize;
pub type RequestId = usize;
pub type ProgressInfo = Arc<RwLock<RequestProgress>>;

/// Wrapper for HeaderMap to make it FFI-compatible
pub struct HeaderMapWrapper(pub HeaderMap);

/// Wrapper for Client to make it FFI-compatible
pub struct ClientWrapper(pub Client);

/// Wrapper for ClientBuilder to make it FFI-compatible
pub struct ClientBuilderWrapper {
    pub builder: reqwest::ClientBuilder,
    pub error_message: Option<String>,
}

/// Wrapper for RequestBuilder to make it FFI-compatible
pub struct RequestBuilderWrapper {
    pub builder: Option<RequestBuilder>,
    pub client_id: ClientId,
    pub output_file_path: Option<String>,
    pub error_message: Option<String>,
}

impl RequestBuilderWrapper {
    // Helper method to take the builder out, apply a function, and put it back
    pub fn with_builder<F>(&mut self, f: F) -> bool
    where
        F: FnOnce(RequestBuilder) -> RequestBuilder,
    {
        if self.error_message.is_some() {
            // If there's already an error, don't try to modify the builder further.
            return false;
        }
        if let Some(builder) = self.builder.take() {
            self.builder = Some(f(builder));
            true
        } else {
            // This case should not be hit if the API is used correctly,
            // as the builder is only taken by send(). But as a safeguard:
            self.error_message = Some("Request builder was already consumed.".to_string());
            false
        }
    }
}

/// Request status enum
#[derive(Debug, Clone, Copy, PartialEq)]
pub enum RequestStatus {
    InProgress,
    Completed,
    Error,
    Cancelled,
}

/// Progress tracking for requests
pub struct RequestProgress {
    pub status: RequestStatus,
    pub total_bytes: Option<u64>,
    pub received_bytes: u64,
    pub final_response: Option<Response>,
}

/// Response struct that can be passed back to LabVIEW
pub struct Response {
    pub status: StatusCode,
    pub headers: HeaderMap,
    pub body: Result<Vec<u8>, String>,
}

/// HTTP method constants
pub const HTTP_METHOD_GET: u8 = 1;
pub const HTTP_METHOD_POST: u8 = 2;
pub const HTTP_METHOD_PUT: u8 = 3;
pub const HTTP_METHOD_DELETE: u8 = 4;
pub const HTTP_METHOD_HEAD: u8 = 5;
pub const HTTP_METHOD_OPTIONS: u8 = 6;
pub const HTTP_METHOD_PATCH: u8 = 7;

/// TLS version constants
pub const TLS_VERSION_1_0: u8 = 1;
pub const TLS_VERSION_1_1: u8 = 2;
pub const TLS_VERSION_1_2: u8 = 3;
pub const TLS_VERSION_1_3: u8 = 4;
