# reqwest-dll

A DLL wrapper around the Rust reqwest library that can be called from LabVIEW.

## Building

To build the DLL:

```powershell
cargo build --release
```

The DLL will be located at `target/release/reqwest.dll`.

## Available Functions

The DLL exports the following functions for use in LabVIEW:

### Client Management

- `reqwest_client_new()` - Create a new HTTP client
- `reqwest_client_close(client_ptr)` - Close an HTTP client and free resources

### Synchronous HTTP Methods

- `reqwest_get(client_ptr, url, num_bytes)` - Perform a GET request
- `reqwest_post_json(client_ptr, url, json_body, num_bytes)` - Perform a POST request with JSON body
- `reqwest_put_json(client_ptr, url, json_body, num_bytes)` - Perform a PUT request with JSON body
- `reqwest_delete(client_ptr, url, num_bytes)` - Perform a DELETE request
- `reqwest_post_form(client_ptr, url, form_data, num_bytes)` - Perform a POST request with form data
- `reqwest_get_with_header(client_ptr, url, header_name, header_value, num_bytes)` - Perform a GET request with a custom header

### Asynchronous HTTP Methods

- `reqwest_async_get_start(client_ptr, url)` - Start an asynchronous GET request and return a request ID
- `reqwest_async_is_complete(request_id)` - Check if an async request is complete
- `reqwest_async_get_progress(request_id)` - Get the progress of an async request (0-100)
- `reqwest_async_get_response(request_id, num_bytes)` - Get the response data from an async request
- `reqwest_async_cancel(request_id)` - Cancel an async request
- `reqwest_async_cleanup(request_id)` - Clean up an async request and remove it from memory

### Utilities

- `reqwest_get_status(client_ptr, url)` - Get HTTP status code from a response
- `cstring_free_memory(string_ptr)` - Free memory allocated for a string returned by any function

## Using in LabVIEW

### Synchronous API

Here's a basic workflow for using the synchronous API in LabVIEW:

1. Call `reqwest_client_new()` to get a client pointer
2. Use the client pointer with the HTTP methods like `reqwest_get()`
3. For functions that return strings, always call `cstring_free_memory()` to free the memory
4. When done, call `reqwest_client_close()` to free the client resources

### Asynchronous API

The asynchronous API allows for non-blocking HTTP requests with progress tracking:

1. Call `reqwest_client_new()` to get a client pointer
2. Start an async request with `reqwest_async_get_start()` to get a request ID
3. Periodically check the request status with `reqwest_async_is_complete()`
4. Monitor download progress with `reqwest_async_get_progress()`
5. When the request is complete, get the response data with `reqwest_async_get_response()`
6. Call `cstring_free_memory()` to free the response string memory
7. Call `reqwest_async_cleanup()` to clean up the request resources
8. When done with all requests, call `reqwest_client_close()` to free the client resources

## Function Details

### Synchronous API

#### reqwest_client_new

Creates a new HTTP client.

```
void* reqwest_client_new();
```

Returns a pointer to the client that can be used in other functions.

#### reqwest_client_close

Closes a client and frees resources.

```
void reqwest_client_close(void* client_ptr);
```

#### reqwest_get

Performs a GET request.

```
char* reqwest_get(void* client_ptr, const char* url, uint32_t* num_bytes);
```

The `num_bytes` parameter will be set to the length of the returned string. The returned string must be freed with `cstring_free_memory`.

#### reqwest_post_json

Performs a POST request with a JSON body.

```
char* reqwest_post_json(void* client_ptr, const char* url, const char* json_body, uint32_t* num_bytes);
```

The `json_body` parameter should be a valid JSON string. The returned string must be freed with `cstring_free_memory`.

### Asynchronous API

#### reqwest_async_get_start

Starts an asynchronous GET request.

```
uint64_t reqwest_async_get_start(void* client_ptr, const char* url);
```

Returns a request ID that can be used to track the request's progress.

#### reqwest_async_is_complete

Checks if an async request is complete.

```
bool reqwest_async_is_complete(uint64_t request_id);
```

Returns `true` if the request is complete, `false` otherwise.

#### reqwest_async_get_progress

Gets the progress of an async request.

```
int32_t reqwest_async_get_progress(uint64_t request_id);
```

Returns a value from 0 to 100 representing the percentage of completion. Returns -1 if the request has encountered an error or was cancelled.

#### reqwest_async_get_response

Gets the response data from a completed async request.

```
char* reqwest_async_get_response(uint64_t request_id, uint32_t* num_bytes);
```

The `num_bytes` parameter will be set to the length of the returned string. The returned string must be freed with `cstring_free_memory`.

#### reqwest_async_cancel

Cancels an in-progress async request.

```
bool reqwest_async_cancel(uint64_t request_id);
```

Returns `true` if the request was successfully cancelled, `false` otherwise.

#### reqwest_async_cleanup

Cleans up resources associated with an async request.

```
void reqwest_async_cleanup(uint64_t request_id);
```

This should be called after you're done with a request, whether it completed successfully or was cancelled.

### Utilities

#### cstring_free_memory

Frees memory allocated for a string.

```
void cstring_free_memory(char* string_ptr);
```

This must be called for every string returned from any function in the library to prevent memory leaks.

## Error Handling

Most functions return error information in the response string if an error occurs. Check the beginning of the response string for "Error:" to detect errors.

The `reqwest_get_status` function returns -1 if an error occurs.

For async requests, a progress value of -1 indicates an error or cancellation.
