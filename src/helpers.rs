use reqwest::tls;
use crate::types::{TLS_VERSION_1_2, TLS_VERSION_1_3};

/// Helper function to convert version integer to reqwest::tls::Version
pub fn convert_tls_version(version: u8) -> Option<tls::Version> {
    match version {
        TLS_VERSION_1_2 => Some(tls::Version::TLS_1_2),
        TLS_VERSION_1_3 => Some(tls::Version::TLS_1_3),
        _ => None,
    }
}

/// Helper function to convert method integer to reqwest::Method
pub fn convert_method(method: u8) -> Option<reqwest::Method> {
    use crate::types::*;
    
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