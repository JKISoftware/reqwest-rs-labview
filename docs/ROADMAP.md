## Guiding Principles

*   **Experimental Stage:** This library is experimental. The API is subject to change.
*   **No Deprecation / Breaking Changes Welcome:** We will refactor and replace functionality directly. We will not maintain deprecated functions for backward compatibility. Breaking changes are expected and encouraged in pursuit of a better API.
*   **Async-Only Core:** The Rust library will **only** expose non-blocking, asynchronous functions. Synchronous (blocking) wrappers can be built in the calling application (e.g., LabVIEW) if needed. This means all existing synchronous functions will be **removed**.

## Potential Improvements

Here is a summary of potential improvements, categorized for clarity:

### 1. Client-Wide Configuration

Currently, our `reqwest_client_new` function creates a client with default settings. Many applications need to customize the client's behavior for all requests.

*   **Timeouts:** This is the most critical missing feature. A request could hang indefinitely, freezing the calling application. We should allow setting **connection timeouts** (how long to wait to connect to the server) and **request timeouts** (a total time limit for the entire request).
*   **SSL Verification Control:** Allow disabling SSL certificate verification (as an explicit opt-in) for use with self-signed certificates.
*   **Default Headers:** Instead of adding a header to every single call, users often need to set a header (like an `Authorization` or `User-Agent` header) that is automatically sent with every request made by that client.
*   **Proxy Configuration:** Many corporate or specific network environments require routing traffic through an HTTP or SOCKS proxy.
*   **Redirect Policy:** We could expose settings to control how many redirects to follow before giving up.

### 2. Richer Request Customization

Our current functions are specific to one method and one body type (e.g., `reqwest_post_json`). This leads to a lot of functions and doesn't cover all needs.

*   **Flexible Headers:** The `reqwest_get_with_header` function is a good start, but it only works for GET requests and only allows one header. A better approach would be to create a "header map" object that can be built up by the user and attached to *any* request (`GET`, `POST`, `PUT`, etc.).
*   **More Body Types:** We should support sending raw binary data for uploads.
*   **Multipart Forms:** A very common use case is uploading files using a `multipart/form-data` request, which is not currently possible.
*   **Authentication:** We could add convenience functions for common authentication schemes like Basic Authentication (`user:password`) and Bearer Token authentication.
*   **Query Parameters:** Building URLs with query strings by hand is error-prone. We could provide a way to add key-value query parameters to a request in a structured way.

### 3. More Detailed Response Information

Right now, we can only get the response body. A lot of valuable information is being missed.

*   **Get Response Headers:** Users often need to read headers from the server's response (e.g., to check the `Content-Type`, read rate-limiting information, or get session cookies).
*   **Get Status Code from Response:** The `reqwest_get_status` function makes a whole new request just to get the status. We should be able to get the status code from any completed request (both blocking and async) without having to make a second call.

### 4. Broader Asynchronous Support

Our async functionality is powerful but currently limited to `GET` requests.

*   **Async for All Methods:** We should add asynchronous, non-blocking versions of `POST`, `PUT`, and `DELETE` requests, including support for file streaming uploads and downloads.

## Priorities

This plan is organized into phases. Each phase builds on the previous one.

### Phase 1: Foundational Stability & Flexibility
*   **Goal:** Rework the client creation to be flexible and remove all synchronous functions.
*   **Approach:** We will implement a **builder pattern** for client creation and delete all blocking functions.
*   **Tasks:**
    - [ ] **Implement Client Builder:**
        - `reqwest_client_builder_new()`
        - `reqwest_client_builder_timeout(builder, connect_secs, request_secs)`
        - `reqwest_client_builder_danger_accept_invalid_certs(builder, accept)`
        - `reqwest_client_builder_default_headers(builder, headers)` (Depends on Header Map).
        - `reqwest_client_builder_build(builder)`.
    - [ ] **Implement Reusable Header Map:**
        - `reqwest_headers_new()`
        - `reqwest_headers_add(map, key, value)`
        - `reqwest_headers_free(map)`
    - [ ] **Cull Synchronous Functions:**
        - Remove all blocking functions (`reqwest_get`, `reqwest_post_json`, etc.).
        - Refactor `reqwest_async_get_start` to accept an optional Header Map pointer for per-request headers.
    - [ ] **Update All Tests:**
        - Remove all tests for synchronous functions.
        - Update the remaining async tests to use the new client builder and header map functionality.

### Phase 2: Rich Response Objects (Major API Improvement)
*   **Goal:** Provide users with access to crucial response data like status codes and headers from completed async calls.
*   **Tasks:**
    - [ ] **Introduce a `Response` Object:** This object will encapsulate the final state of a request (success or error).
    - [ ] **Refactor Async Result Function:** The `reqwest_async_get_response` function will be **replaced** by `reqwest_async_take_result(request_id)`, which returns a pointer to the `Response` object.
    - [ ] **Create `Response` Accessors:**
        - `reqwest_response_status(response)`
        - `reqwest_response_headers(response)` (returns a read-only Header Map)
        - `reqwest_response_body_copy(response, ...)`
        - `reqwest_response_error_string_copy(response, ...)`
        - `reqwest_response_free(response)`

### Phase 3: Expand Asynchronous Operations
*   **Goal:** Provide a full suite of asynchronous HTTP methods, as they are now the only methods available.
*   **Tasks:**
    - [ ] **Async POST, PUT, DELETE:** Create `reqwest_async_post_start`, `reqwest_async_put_start`, etc., supporting various body types (JSON, form, binary).

### Phase 4: Advanced Features & Ergonomics
*   **Goal:** Add support for more complex use cases and provide quality-of-life improvements.
*   **Tasks:**
    - [ ] **Authentication Helpers:** Add convenience functions for Basic and Bearer token authentication.
    - [ ] **Multipart Forms:** Implement `multipart/form-data` requests.
    - [ ] **Query Parameter Builder:** Add a structured way to add URL query parameters.
    - [ ] **Proxy & Redirect Configuration:** Expose client-level settings for proxies and redirect policies.
