# LabVIEW VIs Specification for Multipart Form Support

## Overview
This document specifies the LabVIEW VIs required to wrap the new multipart/form-data functionality implemented in the Rust FFI layer. The VIs follow the existing patterns established in the codebase.

## MultipartForm Class VIs

### Location
Create a new LabVIEW class at: `lv_src/MultipartForm/MultipartForm.lvclass`

### Core VIs Required ✅

#### 1. `create.vi` ✅
**Purpose**: Create a new multipart form instance  
**Inputs**:
- `error in` (Error Cluster)

**Outputs**:
- `multipart form out` (MultipartForm.lvclass)
- `error out` (Error Cluster)

**FFI Function**: `multipart_form_create()`  
**Implementation Notes**: 
- Store the pointer in the class private data
- Initialize error handling

---

#### 2. `destroy.vi` ✅
**Purpose**: Clean up multipart form resources  
**Inputs**:
- `multipart form in` (MultipartForm.lvclass)
- `error in` (Error Cluster)

**Outputs**:
- `error out` (Error Cluster)

**FFI Function**: `multipart_form_destroy()`  
**Implementation Notes**:
- Check if pointer is valid before destroying
- Clear the pointer after destruction
- Handle already-destroyed forms gracefully

---

#### 3. `add_text_field.vi` ✅
**Purpose**: Add a text field to the multipart form  
**Inputs**:
- `multipart form in` (MultipartForm.lvclass)
- `field name` (String)
- `field value` (String)
- `error in` (Error Cluster)

**Outputs**:
- `multipart form out` (MultipartForm.lvclass)
- `error out` (Error Cluster)

**FFI Function**: `multipart_form_add_text()`  
**Implementation Notes**:
- Convert LabVIEW strings to C strings
- Check for empty field names
- Propagate errors from FFI

---

#### 4. `add_file.vi` ✅
**Purpose**: Add a file from disk to the multipart form  
**Inputs**:
- `multipart form in` (MultipartForm.lvclass)
- `field name` (String)
- `file path` (Path)
- `error in` (Error Cluster)

**Outputs**:
- `multipart form out` (MultipartForm.lvclass)
- `error out` (Error Cluster)

**FFI Function**: `multipart_form_add_file()`  
**Implementation Notes**:
- Convert LabVIEW path to string
- Validate file exists before calling FFI
- Handle file access errors

---

#### 5. `add_binary_data.vi` ✅
**Purpose**: Add binary data as a file part  
**Inputs**:
- `multipart form in` (MultipartForm.lvclass)
- `field name` (String)
- `data` (U8 Array)
- `filename` (String) - Optional, empty string if not provided
- `mime type` (String) - Optional, empty string for auto-detect
- `error in` (Error Cluster)

**Outputs**:
- `multipart form out` (MultipartForm.lvclass)
- `error out` (Error Cluster)

**FFI Function**: `multipart_form_add_bytes()`  
**Implementation Notes**:
- Pass array pointer and length to FFI
- Handle optional parameters (pass NULL for empty strings)
- Validate MIME type format if provided

---

#### 6. `is_valid.vi` ✅
**Purpose**: Check if the multipart form reference is valid  
**Inputs**:
- `multipart form in` (MultipartForm.lvclass)

**Outputs**:
- `is valid` (Boolean)

**Implementation Notes**:
- Check if internal pointer is non-null
- Check if form has not been consumed
- No FFI call needed, just check class data

---

#### 7. `read_error_message.vi` ✅
**Purpose**: Get the last error message from the multipart form  
**Inputs**:
- `multipart form in` (MultipartForm.lvclass)
- `error in` (Error Cluster)

**Outputs**:
- `error message` (String)
- `multipart form out` (MultipartForm.lvclass)
- `error out` (Error Cluster)

**FFI Function**: `multipart_form_read_error_message()`  
**Implementation Notes**:
- Read and free the C string properly
- Clear error state after reading
- Return empty string if no error

---

## RequestBuilder Class Extension ✅

### Location
Modify existing class at: `lv_src/RequestBuilder/RequestBuilder.lvclass`

### New VI Required

#### `set_multipart_form.vi` ✅
**Purpose**: Attach a multipart form to the request  
**Inputs**:
- `request builder in` (RequestBuilder.lvclass)
- `multipart form` (MultipartForm.lvclass)
- `error in` (Error Cluster)

**Outputs**:
- `request builder out` (RequestBuilder.lvclass)
- `error out` (Error Cluster)

**FFI Function**: `request_builder_multipart()`  
**Implementation Notes**:
- Form is consumed after this call
- Should invalidate the multipart form reference
- Cannot be used with other body methods (json, form, body)
- Add appropriate error messages for conflicts

---

## Library Updates ✅

### reqwest.lvlib ✅
Add the following VIs to the library:
- All MultipartForm class VIs
- The new RequestBuilder VI

### reqwest.aliases ✅
Add Call Library Function Node configurations for:
- `multipart_form_create`
- `multipart_form_destroy`
- `multipart_form_add_text`
- `multipart_form_add_file`
- `multipart_form_add_bytes`
- `multipart_form_read_error_message`
- `request_builder_multipart`

---

## Example VIs

### Location
`lv_src/Examples/`

### Recommended Examples

#### 1. `Example - Multipart Text Fields.vi` ✅
Demonstrates:
- Creating a multipart form
- Adding multiple text fields
- Sending the request
- Cleaning up resources

#### 2. `Example - File Upload.vi` ✅
Demonstrates:
- Creating a multipart form
- Adding a file from disk
- Adding description text field
- Progress tracking during upload
- Error handling for file access

#### 3. `Example - Binary Data Upload.vi`
Demonstrates:
- Creating a multipart form
- Adding binary data with custom filename and MIME type
- Mixing text fields and binary data
- Proper resource cleanup

---

## Testing VIs

### Location
`lv_src/Tests/`

### Required Test VIs

#### 1. `test_multipart_form_basic.vi`
Tests:
- Form creation and destruction
- Adding text fields
- Error handling for invalid inputs

#### 2. `test_multipart_file_upload.vi`
Tests:
- File upload functionality
- File not found errors
- Large file handling

#### 3. `test_multipart_integration.vi`
Tests:
- Full request flow with multipart
- Server response validation
- Resource cleanup verification

---

## Implementation Order

1. **Phase 1 - Core Class**
   - Create MultipartForm.lvclass
   - Implement create.vi and destroy.vi
   - Implement is_valid.vi
   - Test basic lifecycle

2. **Phase 2 - Text Support**
   - Implement add_text_field.vi
   - Implement read_error_message.vi
   - Create basic test VI
   - Test with httpbin.org

3. **Phase 3 - RequestBuilder Integration**
   - Implement set_multipart_form.vi
   - Test end-to-end flow
   - Verify form consumption

4. **Phase 4 - File Support**
   - Implement add_file.vi
   - Implement add_binary_data.vi
   - Create file upload examples
   - Test with various file types

5. **Phase 5 - Polish**
   - Create comprehensive examples
   - Add inline documentation
   - Create test suite
   - Update main documentation

---

## Design Considerations

### Error Handling
- All VIs should use standard LabVIEW error clusters
- FFI errors should be converted to appropriate LabVIEW error codes
- Provide descriptive error messages
- Chain errors properly through all VIs

### Memory Management
- Forms must be explicitly destroyed if not consumed
- Consumed forms (attached to request) are automatically cleaned up
- Prevent use-after-free by invalidating consumed form references
- Clear pointers in class data after destruction

### Type Safety
- Use strict typing for all inputs/outputs
- Validate string inputs for NULL/empty cases
- Check array bounds for binary data
- Ensure path validity before file operations

### Performance
- Minimize string copies between LabVIEW and C
- Use appropriate buffer sizes for file operations
- Consider streaming for large files (future enhancement)
- Batch multiple field additions when possible

### Compatibility
- Follow existing VI naming conventions
- Use consistent connector pane patterns
- Match error handling style of existing VIs
- Maintain backward compatibility

---

## Documentation Requirements

### VI Documentation
Each VI should include:
- Context Help description
- Parameter descriptions
- Example usage
- Error conditions
- Related VIs links

### Class Documentation
- Class description in properties
- Usage patterns
- Lifecycle management notes
- Integration examples

### Updates to Existing Docs
- Update main README with multipart examples
- Add to API reference documentation
- Include in migration guide if applicable
- Update roadmap status

---

## Validation Checklist

Before considering implementation complete:

- [ ] All VIs created and functional
- [ ] FFI functions properly wrapped
- [ ] Error handling comprehensive
- [ ] Memory leaks verified absent
- [ ] Examples run successfully
- [ ] Tests pass consistently
- [ ] Documentation complete
- [ ] Code review performed
- [ ] Integration with existing code verified
- [ ] Performance acceptable for large files

---

## Notes for Implementation

1. **FFI Calling Convention**: Ensure all Call Library Function Nodes use the correct calling convention (cdecl)

2. **String Handling**: LabVIEW strings must be converted to C strings with null termination

3. **Pointer Management**: Store pointers as U64 in LabVIEW to ensure 64-bit compatibility

4. **Thread Safety**: The FFI functions are not thread-safe; ensure VIs are not reentrant unless explicitly safe

5. **Platform Differences**: Test on Windows, Linux, and macOS to ensure path handling works correctly

6. **Unicode Support**: Ensure proper UTF-8 encoding for all string parameters

This specification provides a complete blueprint for implementing multipart form support in the LabVIEW layer of the reqwest-rs-labview library.