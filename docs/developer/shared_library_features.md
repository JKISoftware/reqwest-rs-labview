# Reqwest FFI Library Feature List

This document outlines the features of the Reqwest FFI (Foreign Function Interface) library, which provides a C-compatible API for making HTTP requests in non-Rust applications.

## 1. Client Management

The library allows for the creation and configuration of persistent HTTP clients.

- **Client Creation**:
  - Create a `ClientBuilder` to configure a new client.
  - Build a `Client` from the builder.
- **Client Configuration**:
  - Set default headers for all requests made by the client.
  - Configure request timeouts (total request duration).
  - Configure connection timeouts.
  - Option to accept invalid server certificates for development/testing purposes (use with caution).
- **Client Lifecycle**:
  - Close a client to free its resources.
  - Closing a client automatically cancels all of its pending requests.

## 2. Header Management

Custom HTTP headers can be created and managed for both clients and individual requests.

- **Header Maps**:
  - Create new header maps.
  - Add/append header key-value pairs.
  - Retrieve all headers as a formatted string.
  - Free header map memory.

## 3. Request Building

A flexible builder pattern is used to construct HTTP requests.

- **Request Initiation**:
  - Create a new `RequestBuilder` for a specific HTTP method (GET, POST, PUT, DELETE, etc.) and URL from a client instance.
- **Request Configuration**:
  - Set custom headers for an individual request.
  - Add a single header to a request.
  - Override the client's timeout for a specific request.
  - Add URL query parameters.
- **Request Lifecycle**:
  - The caller is always responsible for freeing a `RequestBuilder` with `request_builder_free()` after it has been used.
- **Error Handling**:
  - If a configuration function fails, an error message is stored in the builder. This can be read with `request_builder_read_error_message()`.

## 4. Authentication

The library supports common HTTP authentication schemes.

- **Basic Authentication**: Set a username and an optional password.
- **Bearer Authentication**: Set a bearer token for token-based authentication.

## 5. Body Handling

The library supports various ways to set the request body.

- **Raw Text/Binary Body**: Set the body from a raw string.
- **JSON Body**: Set the body from a JSON string. This automatically sets the `Content-Type` header to `application/json`.
- **Form Body**: Set `application/x-www-form-urlencoded` form data from key-value pairs.

## 6. Sending Requests & Handling Responses

Requests are sent asynchronously, and responses can be inspected in detail.

- **Asynchronous Sending**:
  - Send a configured request, which returns a `RequestId` to track its progress.
  - The request is executed on a background thread pool, preventing the calling thread from blocking.
- **Response Data**:
  - Check if a request has completed, failed, or been cancelled.
  - Get the HTTP status code (e.g., 200, 404).
  - Get response headers.
  - Get the response body as a byte buffer.
  - Get the transport error message if the request failed at the network level (e.g., timeout, DNS failure).
  - Check if a request resulted in a transport error. An HTTP status code like 404 or 500 is **not** a transport error.
- **Response Body Streaming**:
  - Configure a request to stream its response body directly to a specified output file. This is useful for large downloads that might not fit into memory.

## 7. Asynchronous Operations and Progress Tracking

The status of in-flight requests can be monitored.

- **Request Tracking**:
  - Each request is tracked via a unique `RequestId`.
- **Progress Monitoring**:
  - Get the download progress as a percentage.
  - Get the total size of the response body in bytes, if known.
  - Get the number of bytes received so far.
- **Request Cancellation**:
  - Cancel an in-progress request at any time using its `RequestId`.
- **Resource Cleanup**:
  - Clean up the tracking resources associated with a request once it is no longer needed.

## 8. Error Handling

The library distinguishes between two primary error types to help developers diagnose issues accurately. The application logic is responsible for handling HTTP status codes.

### 8.1. Configuration Errors

Occur *before* a request is sent, during the setup of a `ClientBuilder` or `RequestBuilder`.

- **Examples:** Providing an invalid proxy URL, a malformed JSON body, or an invalid header value.
- **Detection:** These errors are stored within the builder instance itself. They can be read using `client_builder_read_error_message()` or `request_builder_read_error_message()`. The builder should be checked for an error before it is used.

### 8.2. Transport Errors

Occur *during* the execution of a request and are related to network or protocol-level issues.

- **Examples:** Network failures (DNS resolution, timeouts), or problems with the HTTP response stream.
- **Detection:** These errors are associated with a `RequestId`. They can be checked for with `request_has_transport_error()` and read with `request_read_transport_error()`.

### 8.3. HTTP Status Codes (Application-Handled)

HTTP status codes like `404 Not Found` or `500 Internal Server Error` are **not** considered errors by the library's error handling system.

- **Successful Transaction:** Receiving a status code means the library successfully communicated with the server and received a valid response.
- **Application Responsibility:** It is the responsibility of the calling application to read the status code using `request_read_response_status()` and interpret its meaning. The library's job is to deliver the server's response; the application's job is to decide what to do with it.

## 9. Memory Management

The library employs a strict and consistent model for resource ownership to ensure safe and predictable behavior across the FFI boundary.

### 9.1. Object Lifecycle: The "Creator Frees" Model

The library follows a simple, absolute rule for all major objects (`ClientBuilder`, `RequestBuilder`, `HeaderMap`): **If you create it, you must free it.**

- **Rule:** Any object created with a `_new()` function *must* be cleaned up by calling its corresponding `_free()` function (e.g., `client_builder_free()`, `request_builder_free()`).
- **Consistency:** This rule applies universally, regardless of whether an operation succeeds or fails. Functions like `client_builder_build()` or `request_builder_send()` **never** free the builder for you.
- **Responsibility:** The calling application is always responsible for managing the lifecycle of these objects to prevent memory leaks.

### 9.2. String Deallocation

For strings returned by the library (e.g., response bodies, headers, error messages), a dedicated function, `free_memory()`, is provided. The caller must use this function to deallocate these strings to prevent memory leaks.
