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
  - Free a `RequestBuilder` if it's no longer needed before sending.

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
  - Get the error message if the request failed.
  - Check if a request resulted in an error.
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

## 8. Memory Management

The library provides functions to manage memory allocated for data passed across the FFI boundary.

- **String Deallocation**: A dedicated function is provided to free the memory of strings returned by the library (e.g., response bodies, headers). This is crucial to prevent memory leaks in the calling application.
