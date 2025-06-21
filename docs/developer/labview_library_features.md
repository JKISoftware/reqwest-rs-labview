# LabVIEW Reqwest Library Feature List

This document outlines the features of the LabVIEW wrapper for the Reqwest library, providing an idiomatic LabVIEW API for making HTTP requests. The library is organized into classes that wrap the underlying shared library handles.

## 1. Client Management

The library allows for the creation and configuration of persistent HTTP clients using the `Client` and `ClientBuilder` classes.

- **Client Creation**:
  - `ClientBuilder/new_client_builder.vi`: Creates a new builder for configuring a client.
  - `ClientBuilder/build_client.vi`: Constructs a `Client.lvclass` object from the builder.
- **Client Configuration**:
  - `ClientBuilder/set_default_headers.vi`: Sets default headers for all requests made by the client.
  - `ClientBuilder/set_timeout_ms.vi`: Configures the total request timeout.
  - `ClientBuilder/set_connect_timeout_ms.vi`: Configures the connection timeout.
  - `ClientBuilder/set_danger_accept_invalid_certs.vi`: Allows the client to accept invalid server certificates (for testing).
- **Client Lifecycle**:
  - `Client/close.vi`: Closes the client, frees its resources, and cancels any pending requests.

## 2. Header Management

The `Headers.lvclass` provides methods for creating and managing HTTP headers.

- **Header Maps**:
  - `Headers/new_headers.vi`: Creates a new, empty header map.
  - `Headers/add_header.vi`: Adds a key-value pair to the header map.
  - `Headers/get_all.vi`: Retrieves all headers as a formatted, multi-line string.
  - `Headers/free_headers.vi`: Frees the memory associated with the header map.

## 3. Request Building

The `RequestBuilder.lvclass` uses a builder pattern to construct HTTP requests.

- **Request Initiation**:
  - `Client/new_request_builder.vi`: Creates a `RequestBuilder` for a specific HTTP method and URL.
- **Request Configuration**:
  - `RequestBuilder/set_headers.vi`: Sets the headers for the request using a `Headers.lvclass` object.
  - `RequestBuilder/set_timeout_ms.vi`: Overrides the client's timeout for this specific request.
  - *Note: Specific VIs for adding individual headers or query parameters are not present and may require manual header construction.*
- **Request Lifecycle**:
  - The `RequestBuilder.lvclass` is a "by-value" class, so no explicit free is needed if a request is not sent.

## 4. Authentication

The library supports common HTTP authentication schemes.

- **Basic Authentication**: `RequestBuilder/set_basic_auth.vi`
- **Bearer Authentication**: `RequestBuilder/set_bearer_auth.vi`

## 5. Body Handling

The library supports setting the request body in various formats.

- *Note: No specific VIs for `body`, `json`, or `form` are exposed in the `RequestBuilder` class. This functionality would need to be added.*

## 6. Sending Requests & Handling Responses

Requests are sent asynchronously, returning a `Request.lvclass` object to manage the operation.

- **Asynchronous Sending**:
  - `RequestBuilder/send.vi`: Sends the configured request and returns a `Request.lvclass` object to track its progress.
- **Response Data**:
  - `Request/get_is_complete.vi`: Checks if a request has completed, failed, or been cancelled.
  - `Request/get_response_status.vi`: Gets the HTTP status code.
  - `Request/get_response_headers.vi`: Gets the response headers as a `Headers.lvclass` object.
  - `Request/get_response_body.vi`: Gets the response body as a string.
  - *Note: No specific VI to get an error message is present; errors are likely handled via standard LabVIEW error terminals.*

- **Response Body Streaming**:
  - `RequestBuilder/set_output_file.vi`: Configures the request to stream its response body directly to a file.

## 7. Asynchronous Operations and Progress Tracking

The `Request.lvclass` allows for monitoring in-flight requests.

- **Request Tracking**:
  - Each request is uniquely identified by the `Request.lvclass` object instance.
- **Progress Monitoring**:
  - `Request/get_progress.vi`: Gets the download progress as a percentage.
  - `Request/get_total_bytes.vi`: Gets the total size of the response body in bytes.
  - `Request/get_received_bytes.vi`: Gets the number of bytes received so far.
- **Request Cancellation**:
  - `Request/Cancel.vi`: Cancels an in-progress request.
- **Resource Cleanup**:
  - `Request/cleanup.vi`: Cleans up the tracking resources associated with a completed or cancelled request.

## 8. Memory Management

The library includes support VIs to handle memory for data passed from the shared library.

- **Support VIs**:
  - `support/free_c_string_at_memory_address.vi`
  - `support/read_c_string_at_memory_address.vi`
  - `support/support.read_and_free_string_at_address.vi`
  - These are generally used internally by the class VIs but are available for advanced use cases.
