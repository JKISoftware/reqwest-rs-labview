use reqwest_dll::*;
use crate::integration::common::{constants::*, wait_for_request_with_retry};
use std::time::Duration;
use std::sync::Arc;
use std::net::TcpListener;
use serde_json::Value;

use async_trait::async_trait;
use pingora_core::server::Server;
use pingora_core::server::configuration::ServerConf;
use pingora_core::upstreams::peer::HttpPeer;
use pingora_core::Result;
use pingora_proxy::{ProxyHttp, Session};

// Define a simple proxy service that just forwards the request
struct TestProxyService;

#[async_trait]
impl ProxyHttp for TestProxyService {
    type CTX = ();
    fn new_ctx(&self) -> Self::CTX {}

    async fn upstream_peer(&self, session: &mut Session, _ctx: &mut ()) -> Result<Box<HttpPeer>> {
        // Extract the host and port from the request URL
        let uri = session.req_header().uri.clone();
        let host = uri.host().unwrap_or("httpbin.org");
        let port = uri.port_u16().unwrap_or(if uri.scheme_str() == Some("https") { 443 } else { 80 });
        let use_tls = uri.scheme_str() == Some("https");
        
        println!("Proxy forwarding to {}:{} (TLS: {})", host, port, use_tls);
        
        // Create a peer with the appropriate host and port
        let peer = Box::new(HttpPeer::new((host, port), use_tls, host.to_string()));
        Ok(peer)
    }
    
    async fn logging(&self, session: &mut Session, e: Option<&pingora_core::Error>, _ctx: &mut Self::CTX) {
        let status = session.response_written().map(|r| r.status.as_u16()).unwrap_or(0);
        println!("Proxy request: {} {} -> status: {}", 
            session.req_header().method, 
            session.req_header().uri, 
            status);
        
        if let Some(err) = e {
            println!("Proxy error: {:?}", err);
        }
    }
}

// Find an available port
fn find_available_port() -> Option<u16> {
    // Try to bind to port 0, which lets the OS choose an available port
    if let Ok(listener) = TcpListener::bind("127.0.0.1:0") {
        if let Ok(addr) = listener.local_addr() {
            return Some(addr.port());
        }
    }
    None
}

// Start a Pingora proxy server on a specific port
fn start_proxy_server(port: u16) -> Arc<()> {
    // Create server configuration
    let _conf = ServerConf::default();
    let mut server = Server::new(None).unwrap();
    server.bootstrap();

    // Create a proxy service
    let mut proxy = pingora_proxy::http_proxy_service(&server.configuration, TestProxyService);
    
    // Add a TCP listener on the specified port
    let bind_addr = format!("127.0.0.1:{}", port);
    println!("Adding TCP listener on {}", bind_addr);
    proxy.add_tcp(&bind_addr);
    
    // Add the service to the server
    server.add_service(proxy);
    
    // Create a thread handle to return
    let handle = Arc::new(());
    let handle_clone = handle.clone();
    
    // Run the server in a background thread
    std::thread::spawn(move || {
        println!("Starting proxy server...");
        server.run_forever();
    });
    
    // Wait a moment for the server to start
    std::thread::sleep(Duration::from_millis(500));
    println!("Proxy server should be running now");
    
    handle_clone
}

#[test]
fn test_client_with_proxy() {
    // Find an available port
    let port = match find_available_port() {
        Some(p) => p,
        None => {
            println!("Could not find an available port, skipping test");
            return;
        }
    };
    
    println!("Starting proxy server on port {}", port);
    
    // Start our local proxy server
    let _server = start_proxy_server(port);
    
    // Build a client with the proxy
    let client_builder_ptr = client_builder_create();
    assert!(!client_builder_ptr.is_null());
    
    // Set a timeout for the client (10 seconds)
    assert!(client_builder_timeout_ms(client_builder_ptr, 10000));

    let server = std::ffi::CString::new("127.0.0.1").unwrap();
    assert!(client_builder_set_proxy(
        client_builder_ptr,
        server.as_ptr(),
        port,
        std::ptr::null(),
        std::ptr::null()
    ));

    let client_id = client_builder_create_client_and_start(client_builder_ptr);
    assert!(client_id != 0, "Failed to create client with proxy");

    // Create a URL for testing - use HTTP instead of HTTPS to avoid CONNECT issues
    let url = std::ffi::CString::new("http://httpbin.org/get").unwrap();

    // Create a GET request builder
    let request_builder_ptr =
        client_create_request_builder(client_id, HTTP_METHOD_GET, url.as_ptr());
    assert!(!request_builder_ptr.is_null());

    let request_id = request_builder_create_request_and_send(request_builder_ptr);
    assert!(request_id > 0);

    // Wait for the request to complete
    let (status, error_msg) = wait_for_request_with_retry(request_id, 3);
    if let Some(err) = &error_msg {
        println!("Error message: {}", err);
    }
    
    assert_eq!(
        status, 200,
        "Request through proxy failed with status {}",
        status
    );

    // Get the response body
    let mut body_len: u32 = 0;
    let body_ptr = request_read_response_body(request_id, &mut body_len);
    assert!(!body_ptr.is_null());
    assert!(body_len > 0);

    let body_str = unsafe {
        let body_slice = std::slice::from_raw_parts(body_ptr as *const u8, body_len as usize);
        std::str::from_utf8(body_slice).unwrap_or("")
    };

    // Parse the JSON and check the origin
    let v: Value = serde_json::from_str(body_str).expect("Failed to parse JSON from httpbin");
    let origin = v["origin"].as_str().unwrap_or_default();

    println!("Request origin IP from httpbin: {}", origin);
    assert!(!origin.is_empty(), "Origin IP should not be empty");

    // Clean up
    string_destroy(body_ptr);
    request_destroy(request_id);
    client_destroy(client_id);
    client_builder_destroy(client_builder_ptr);
} 