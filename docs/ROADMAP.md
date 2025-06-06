## Potential Improvements

Here is a summary of potential improvements, categorized for clarity:

### 1. Client-Wide Configuration

Currently, our `reqwest_client_new` function creates a client with default settings. Many applications need to customize the client's behavior for all requests.

*   **Timeouts:** This is the most critical missing feature. A request could hang indefinitely, freezing the calling application. We should allow setting **connection timeouts** (how long to wait to connect to the server) and **request timeouts** (a total time limit for the entire request).
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
*   **Goal:** Make the library robust and flexible for common use cases.
*   **Tasks:**
    - [ ] **Implement Timeouts:** Create a new client constructor that accepts timeout values (connect, and total request). This is the highest priority.
    - [ ] **Implement Reusable Headers:** Create a "Header Map" object that can be built and passed to any request.
    - [ ] **Update Request Functions:** Modify all request functions (`get`, `post_json`, etc.) to accept an optional Header Map pointer. This will deprecate `reqwest_get_with_header`.
    - [ ] **Implement Default Headers on Client:** Enhance the client constructor to also accept a Header Map for default headers.

### Phase 2: Rich Response Objects (Major API Improvement)
*   **Goal:** Provide users with access to crucial response data like status codes and headers without needing to make extra requests.
*   **Note:** This will be a **breaking change** to the API, as function return types will change.
*   **Tasks:**
    - [ ] **Introduce a `Response` Object:** Instead of returning raw body bytes, functions will return a pointer to an opaque `Response` object.
    - [ ] **Create `Response` Accessors:** Add functions to get data from the response object (status, headers, body) and to free it.
    - [ ] **Refactor All Request Functions:** Update all synchronous and asynchronous functions to return this new `Response` object.

### Phase 3: Expand Asynchronous Operations
*   **Goal:** Make the powerful asynchronous capabilities available for all common HTTP methods.
*   **Tasks:**
    - [ ] **Async POST, PUT, DELETE:** Create asynchronous, non-blocking versions of `POST`, `PUT`, and `DELETE` requests.

### Phase 4: Advanced Features & Ergonomics
*   **Goal:** Add support for more complex use cases and provide quality-of-life improvements.
*   **Tasks:**
    - [ ] **Authentication Helpers:** Add convenience functions for Basic and Bearer token authentication.
    - [ ] **Multipart Forms:** Implement `multipart/form-data` requests.
    - [ ] **Query Parameter Builder:** Add a structured way to add URL query parameters.
    - [ ] **Proxy & Redirect Configuration:** Expose client-level settings for proxies and redirect policies.
