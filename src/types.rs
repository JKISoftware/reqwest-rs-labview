use std::sync::{Arc, RwLock};
use reqwest::{
    header::HeaderMap,
    Client, ClientBuilder, RequestBuilder, StatusCode,
};

/// Types to track ongoing requests
pub type RequestId = u64;
pub type ClientId = u64;
pub type ProgressInfo = Arc<RwLock<RequestProgress>>;

/// Struct to track progress of the request (i.e. the response)
pub struct RequestProgress {
    pub status: RequestStatus,
    pub total_bytes: Option<u64>,
    pub received_bytes: u64,
    pub final_response: Option<Response>,
}

/// Enum to track request status
#[derive(PartialEq)]
pub enum RequestStatus {
    InProgress,
    Completed,
    Error,
    Cancelled,
}

/// Response type that contains HTTP status, headers and body
pub struct Response {
    pub status: StatusCode,
    pub headers: HeaderMap,
    pub body: Result<Vec<u8>, String>,
}

/// Wrapper for the reqwest HeaderMap
pub struct HeaderMapWrapper(pub HeaderMap);

/// Wrapper for the reqwest Client
pub struct ClientWrapper(pub Client);

/// Wrapper for the reqwest ClientBuilder
pub struct ClientBuilderWrapper {
    pub builder: ClientBuilder,
    pub error_message: Option<String>,
}

/// Wrapper for the reqwest RequestBuilder
pub struct RequestBuilderWrapper {
    pub builder: Option<RequestBuilder>,
    pub client_id: ClientId,
    pub output_file_path: Option<String>,
    pub error_message: Option<String>,
}

/// HTTP method constants (internal use only)
/// These values should match the enum values defined in LabVIEW
pub const HTTP_METHOD_GET: u8 = 1;
pub const HTTP_METHOD_POST: u8 = 2;
pub const HTTP_METHOD_PUT: u8 = 3;
pub const HTTP_METHOD_DELETE: u8 = 4;
pub const HTTP_METHOD_HEAD: u8 = 5;
pub const HTTP_METHOD_OPTIONS: u8 = 6;
pub const HTTP_METHOD_CONNECT: u8 = 7;
pub const HTTP_METHOD_PATCH: u8 = 8;
pub const HTTP_METHOD_TRACE: u8 = 9;

/// TLS Version constants
/// These values should match the enum values defined in LabVIEW if any.
/// We only expose the versions relevant for testing this feature.
pub const TLS_VERSION_1_2: u8 = 1;
pub const TLS_VERSION_1_3: u8 = 2; 