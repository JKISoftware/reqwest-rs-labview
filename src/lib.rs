/*
 * reqwest-rs-labview: A LabVIEW-compatible wrapper for the reqwest HTTP client library
 */

// Internal modules
mod async_support;
mod ffi;
mod globals;
mod helpers;
mod types;

// Re-export FFI functions for external use
// Import specific functions instead of using glob imports to avoid ambiguity
pub use ffi::client::{
    client_builder_create_client_and_start, client_cancel_all_requests,
    client_create_request_builder, client_destroy,
};
pub use ffi::client_builder::{
    client_builder_connect_timeout_ms, client_builder_create,
    client_builder_danger_accept_invalid_certs, client_builder_default_headers,
    client_builder_destroy, client_builder_https_proxy, client_builder_min_tls_version,
    client_builder_no_proxy, client_builder_read_error_message, client_builder_set_proxy,
    client_builder_timeout_ms, client_builder_user_agent,
};
pub use ffi::headers::{headers_add, headers_create, headers_destroy, headers_get_all};
pub use ffi::request::{
    request_cancel, request_destroy, request_has_transport_error, request_is_complete,
    request_read_progress, request_read_received_bytes, request_read_response_body,
    request_read_response_headers, request_read_response_status, request_read_total_bytes,
    request_read_transport_error,
};
pub use ffi::request_builder::{
    request_builder_basic_auth, request_builder_bearer_auth, request_builder_body,
    request_builder_create_request_and_send, request_builder_destroy, request_builder_form,
    request_builder_header, request_builder_headers, request_builder_json, request_builder_query,
    request_builder_read_error_message, request_builder_set_output_file,
    request_builder_timeout_ms,
};
pub use ffi::utils::string_destroy;
