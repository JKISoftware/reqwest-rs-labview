use reqwest::{Method, tls::Version};
use crate::types::*;

/// Convert a method integer to a reqwest::Method
pub fn convert_method(method: u8) -> Option<Method> {
    match method {
        HTTP_METHOD_GET => Some(Method::GET),
        HTTP_METHOD_POST => Some(Method::POST),
        HTTP_METHOD_PUT => Some(Method::PUT),
        HTTP_METHOD_DELETE => Some(Method::DELETE),
        HTTP_METHOD_HEAD => Some(Method::HEAD),
        HTTP_METHOD_OPTIONS => Some(Method::OPTIONS),
        HTTP_METHOD_PATCH => Some(Method::PATCH),
        _ => None,
    }
}

/// Convert a TLS version integer to a reqwest::tls::Version
pub fn convert_tls_version(version: u8) -> Option<Version> {
    match version {
        TLS_VERSION_1_0 => Some(Version::TLS_1_0),
        TLS_VERSION_1_1 => Some(Version::TLS_1_1),
        TLS_VERSION_1_2 => Some(Version::TLS_1_2),
        TLS_VERSION_1_3 => Some(Version::TLS_1_3),
        _ => None,
    }
} 