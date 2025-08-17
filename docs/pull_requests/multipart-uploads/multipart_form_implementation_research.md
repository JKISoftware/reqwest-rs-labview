# Multipart/Form-Data Upload Support Research

## Executive Summary

This document outlines the research findings for adding multipart/form-data upload support to the reqwest-rs-labview library. The library currently supports simple form data (`application/x-www-form-urlencoded`) but lacks multipart form support, which is essential for file uploads and complex form submissions.

## Current State

### Existing Form Support
The library currently implements basic form support through:
- **Function**: `request_builder_form` (src/ffi/request_builder.rs:396)
- **Capability**: Sends simple key-value pairs as `application/x-www-form-urlencoded`
- **Limitation**: Can only handle text data, not file uploads or binary content
- **LabVIEW Interface**: `set_request_body_form.vi` in RequestBuilder class

### Architecture Overview
The library follows a clear FFI pattern:
1. **Rust Core**: Async HTTP operations using reqwest
2. **FFI Layer**: C-compatible functions exposed to LabVIEW
3. **LabVIEW Wrapper**: VIs that call the FFI functions
4. **Request Flow**: Client → RequestBuilder → Request → Response

## Reqwest Multipart Capabilities

### Core Features
Reqwest provides comprehensive multipart support through its `multipart` module:
- **Module**: `reqwest::multipart`
- **Main Types**: `Form` and `Part`
- **Feature Flag**: Requires `multipart` feature in Cargo.toml
- **Async Support**: Fully async-compatible

### Key Functionality
1. **Text Parts**: Add text fields with optional metadata
2. **File Parts**: Upload files from disk or memory
3. **Streaming**: Support for large files without full memory load
4. **Metadata**: Custom filenames, MIME types, and headers per part

## Implementation Requirements

### 1. Cargo.toml Update
```toml
reqwest = { version = "0.12.20", features = ["json", "stream", "rustls-tls", "multipart"], default-features = false }
```

### 2. New FFI Functions Needed

#### Core Multipart Functions
- `multipart_form_create()` - Create a new multipart form
- `multipart_form_destroy()` - Clean up form resources
- `multipart_form_add_text()` - Add text field to form
- `multipart_form_add_file()` - Add file from path
- `multipart_form_add_bytes()` - Add binary data with metadata
- `request_builder_multipart()` - Attach form to request builder

#### Supporting Types
- `MultipartFormWrapper` - FFI-compatible wrapper for `reqwest::multipart::Form`
- `MultipartPartWrapper` - Optional wrapper for complex part configuration

### 3. Integration Points

#### Request Builder Modification
The `RequestBuilderWrapper` structure would need to support multipart forms:
- Add method to accept multipart form instead of simple form/body
- Ensure mutual exclusivity (can't have both body and multipart)
- Handle ownership transfer of the multipart form

#### Memory Management
- Forms and parts need proper lifecycle management
- File paths must be validated and accessible
- Binary data needs safe transfer from LabVIEW to Rust

### 4. LabVIEW Interface Design

#### New VIs Required
1. **Multipart Form Class**
   - `create.vi` - Initialize new form
   - `add_text_field.vi` - Add text key-value pair
   - `add_file.vi` - Add file from path
   - `add_binary_data.vi` - Add bytes with filename/mime
   - `destroy.vi` - Clean up resources

2. **RequestBuilder Extension**
   - `set_multipart_form.vi` - Attach multipart form to request

#### Usage Pattern
```
1. Create multipart form
2. Add fields (text/files/binary)
3. Attach to request builder
4. Send request
5. Clean up form (if not consumed)
```

## Implementation Approach

### Phase 1: Basic Text Multipart
- Implement `multipart_form_create/destroy`
- Add `multipart_form_add_text` for text fields
- Create `request_builder_multipart` to attach form
- Test with text-only multipart forms

### Phase 2: File Upload Support
- Implement `multipart_form_add_file` for file paths
- Add proper error handling for file access
- Support custom filenames and MIME types
- Test with various file types and sizes

### Phase 3: Binary Data Support
- Implement `multipart_form_add_bytes` for in-memory data
- Handle large binary transfers safely
- Add streaming support for large files
- Performance optimization

### Phase 4: LabVIEW Integration
- Create MultipartForm LabVIEW class
- Implement all VIs with proper error handling
- Add examples for common use cases
- Update documentation

## Technical Considerations

### Memory Safety
- File paths need validation before use
- Binary data must be copied, not referenced
- Proper cleanup of temporary resources
- Handle partial failures gracefully

### Error Handling
- File not found or access denied
- Invalid MIME types
- Memory allocation failures
- Network errors during upload

### Performance
- Streaming vs. buffering trade-offs
- Progress tracking for large uploads
- Concurrent multipart uploads
- Memory usage optimization

### Compatibility
- Ensure backward compatibility with existing form support
- Clear distinction between simple and multipart forms
- Consistent API patterns with existing functions

## Testing Strategy

### Unit Tests
- Test each FFI function independently
- Verify memory management and cleanup
- Error condition handling

### Integration Tests
- End-to-end multipart upload tests
- Various file types and sizes
- Mixed text and binary fields
- Progress tracking verification

### LabVIEW Tests
- VI functionality verification
- Error cluster propagation
- Memory leak detection
- Performance benchmarks

## Estimated Effort

### Development Time
- **Rust FFI Implementation**: 2-3 days
  - Basic multipart support: 1 day
  - File and binary support: 1 day
  - Testing and refinement: 1 day

- **LabVIEW Integration**: 2-3 days
  - VI development: 1-2 days
  - Testing and examples: 1 day

- **Documentation**: 1 day
  - API documentation
  - Usage examples
  - Migration guide

**Total Estimate**: 5-7 days for complete implementation

## Risks and Mitigations

### Risks
1. **Memory Management Complexity**: Multipart forms involve multiple allocations
   - *Mitigation*: Careful RAII design and thorough testing

2. **Large File Handling**: Memory constraints with large uploads
   - *Mitigation*: Implement streaming from the start

3. **LabVIEW Type Mapping**: Complex data structures crossing FFI boundary
   - *Mitigation*: Keep interface simple, hide complexity in Rust

4. **Breaking Changes**: Potential incompatibility with existing code
   - *Mitigation*: Additive changes only, preserve existing APIs

## Recommendations

1. **Start Simple**: Begin with text-only multipart support to establish the pattern
2. **Prioritize Safety**: Focus on memory safety and error handling over features
3. **Incremental Delivery**: Release basic functionality early for feedback
4. **Comprehensive Testing**: Invest in thorough test coverage from the start
5. **Clear Documentation**: Provide examples for common use cases

## Conclusion

Adding multipart/form-data support is feasible and would complete the HTTP client functionality. The reqwest library provides solid foundations, and the existing FFI patterns in the codebase offer clear guidance for implementation. The main challenges are around memory management and maintaining a clean LabVIEW interface, both of which can be addressed with careful design and testing.