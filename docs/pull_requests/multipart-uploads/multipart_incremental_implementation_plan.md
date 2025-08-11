# Incremental Implementation Plan for Multipart Support

## Overview
This plan provides a step-by-step approach to implementing multipart support, ensuring each increment is independently testable and adds value. Each phase includes validation steps and success criteria.

---

## Phase 1: Basic Text-Only Multipart (Day 1)
**Goal**: Establish the foundation with text-only multipart forms that can be sent successfully.

### Step 1.1: Minimal Rust Implementation ✅ COMPLETED
- [x] Enable multipart feature in Cargo.toml
- [x] Create basic FFI functions for text-only multipart
- [x] Add MultipartFormWrapper type
- [x] Implement create/destroy/add_text functions
- [x] Connect to request builder

### Step 1.2: Basic Integration Test ✅ COMPLETED
- [x] Create simple test that sends text fields to httpbin.org
- [x] Verify response contains the sent fields
- [x] Test error handling

### Validation Checkpoint 1 ✅
- Run: `cargo test test_multipart_form_with_request`
- Expected: Test passes, httpbin.org echoes back the text fields
- **Status**: ✅ All tests passing

---

## Phase 2: LabVIEW Basic Integration (Day 2)
**Goal**: Create minimal LabVIEW VIs to test text-only multipart from LabVIEW.

### Step 2.1: Create MultipartForm Class Structure
1. Create `lv_src/MultipartForm/` directory
2. Create `MultipartForm.lvclass` with private data (U64 for pointer)
3. Add class to `reqwest.lvlib`

### Step 2.2: Implement Core VIs
1. **create.vi**
   - Call `multipart_form_create()`
   - Store pointer in class
   - Test: Create and verify non-zero pointer

2. **destroy.vi**
   - Call `multipart_form_destroy()`
   - Clear pointer
   - Test: Create, destroy, verify pointer cleared

3. **is_valid.vi**
   - Check pointer != 0
   - No FFI call needed
   - Test: Valid after create, invalid after destroy

### Step 2.3: Implement Text Field Support
1. **add_text_field.vi**
   - Convert LabVIEW strings to C strings
   - Call `multipart_form_add_text()`
   - Test: Add field, check return value

### Step 2.4: RequestBuilder Integration
1. **set_multipart_form.vi** in RequestBuilder class
   - Call `request_builder_multipart()`
   - Mark form as consumed
   - Test: Attach form to request

### Step 2.5: Create Simple Test VI
1. Create `test_multipart_text_only.vi`
   - Create client
   - Create multipart form
   - Add 2-3 text fields
   - Attach to POST request
   - Send to httpbin.org/post
   - Verify 200 response

### Validation Checkpoint 2
- Run the test VI in LabVIEW
- Expected: Successful POST with multipart data
- Verify: No memory leaks, proper cleanup

---

## Phase 3: Error Handling & Robustness (Day 3)
**Goal**: Add comprehensive error handling and edge case management.

### Step 3.1: Rust Error Message Support ✅ COMPLETED
- [x] Implement `multipart_form_read_error_message()`
- [x] Test error scenarios (invalid UTF-8, consumed form)

### Step 3.2: LabVIEW Error Handling
1. **read_error_message.vi**
   - Call FFI function
   - Convert to LabVIEW error cluster
   - Test: Trigger various errors

2. Update all VIs with proper error propagation
   - Check error in before operations
   - Set error out on failures
   - Add descriptive error messages

### Step 3.3: Edge Case Tests
1. Create `test_multipart_errors.vi`
   - Test empty field names
   - Test very large text values
   - Test using consumed form
   - Test null/invalid pointers

### Validation Checkpoint 3
- Run error test VI
- Expected: All errors handled gracefully
- Verify: No crashes, clear error messages

---

## Phase 4: File Upload Support (Day 4)
**Goal**: Add ability to upload files from disk.

### Step 4.1: Rust File Support ✅ COMPLETED
- [x] Implement `multipart_form_add_file()`
- [x] Test with local files
- [x] Handle file not found errors

### Step 4.2: LabVIEW File Upload
1. **add_file.vi**
   - Convert LabVIEW path to string
   - Validate file exists
   - Call FFI function
   - Test: Upload small text file

### Step 4.3: File Upload Example
1. Create `Example - File Upload.vi`
   - Let user select file
   - Show upload progress
   - Display response
   - Test with various file types

### Step 4.4: File Error Handling
1. Test file not found
2. Test permission denied
3. Test very large files (>10MB)
4. Test special characters in filenames

### Validation Checkpoint 4
- Upload various file types to httpbin.org
- Expected: All files upload successfully
- Verify: Progress tracking works

---

## Phase 5: Binary Data Support (Day 5)
**Goal**: Add ability to upload in-memory binary data.

### Step 5.1: Rust Binary Support ✅ COMPLETED
- [x] Implement `multipart_form_add_bytes()`
- [x] Support custom filename and MIME type
- [x] Test with various data sizes

### Step 5.2: LabVIEW Binary Upload
1. **add_binary_data.vi**
   - Pass U8 array and length
   - Handle optional filename/MIME
   - Call FFI function
   - Test: Upload generated data

### Step 5.3: Binary Data Example
1. Create `Example - Binary Data Upload.vi`
   - Generate test data (e.g., waveform)
   - Upload as CSV/binary
   - Show custom MIME types
   - Mix with text fields

### Validation Checkpoint 5
- Upload binary data with various MIME types
- Expected: Server receives correct data
- Verify: Data integrity maintained

---

## Phase 6: Complex Scenarios (Day 6)
**Goal**: Test real-world use cases and complex combinations.

### Step 6.1: Mixed Content Form
1. Create `Example - Mixed Multipart Form.vi`
   - Add multiple text fields
   - Add multiple files
   - Add binary data
   - Send as single request

### Step 6.2: Large File Handling
1. Test with files >100MB
2. Implement progress callbacks
3. Test cancellation mid-upload
4. Verify memory usage stays reasonable

### Step 6.3: Concurrent Uploads
1. Test multiple simultaneous multipart requests
2. Verify no resource conflicts
3. Check thread safety

### Validation Checkpoint 6
- Run complex scenario tests
- Expected: All scenarios work correctly
- Verify: Performance acceptable

---

## Phase 7: Documentation & Polish (Day 7)
**Goal**: Complete documentation and prepare for release.

### Step 7.1: API Documentation
1. Add context help to all VIs
2. Create VI snippets for examples
3. Update main README

### Step 7.2: Integration Tests
1. Create comprehensive test suite
2. Run on all platforms (Windows, Linux, macOS)
3. Check for memory leaks with Valgrind

### Step 7.3: Performance Optimization
1. Profile large file uploads
2. Optimize buffer sizes if needed
3. Consider streaming for very large files

### Step 7.4: Final Examples
1. Create real-world examples:
   - Image upload with metadata
   - Form with file attachments
   - Batch file upload
   - Progress bar UI

### Validation Checkpoint 7
- Complete test suite passes
- Documentation review complete
- Performance benchmarks acceptable

---

## Testing Strategy for Each Phase

### Unit Testing (After each VI)
```
1. Create VI
2. Test happy path
3. Test error conditions
4. Test edge cases
5. Verify cleanup
```

### Integration Testing (After each phase)
```
1. Test with httpbin.org
2. Test with local mock server (optional)
3. Verify end-to-end flow
4. Check resource cleanup
```

### Regression Testing (Before each phase)
```
1. Run existing test suite
2. Verify no breaking changes
3. Check backward compatibility
```

---

## Risk Mitigation

### High-Risk Areas
1. **Memory Management**
   - Mitigation: Test with Valgrind after each phase
   - Add explicit cleanup tests

2. **Large File Handling**
   - Mitigation: Start with small files, gradually increase
   - Monitor memory usage during uploads

3. **Platform Differences**
   - Mitigation: Test on primary platform first
   - Add platform-specific tests later

4. **LabVIEW/Rust Interface**
   - Mitigation: Start simple, add complexity gradually
   - Verify pointer handling at each step

---

## Success Metrics

### Phase 1-2: Foundation
- [x] Basic multipart requests working
- [ ] LabVIEW can send text fields

### Phase 3-4: Core Functionality  
- [ ] Error handling robust
- [ ] File uploads working

### Phase 5-6: Advanced Features
- [ ] Binary data uploads working
- [ ] Complex scenarios handled

### Phase 7: Production Ready
- [ ] All tests passing
- [ ] Documentation complete
- [ ] Performance acceptable
- [ ] No memory leaks

---

## Daily Checkpoints

### Day 1 ✅
- Morning: Complete Rust implementation
- Afternoon: Run integration tests
- Status: **COMPLETED**

### Day 2
- Morning: Create LabVIEW class structure
- Afternoon: Test text-only multipart from LabVIEW

### Day 3
- Morning: Add error handling
- Afternoon: Test edge cases

### Day 4
- Morning: Add file upload support
- Afternoon: Test with various files

### Day 5
- Morning: Add binary data support
- Afternoon: Create examples

### Day 6
- Morning: Test complex scenarios
- Afternoon: Performance optimization

### Day 7
- Morning: Complete documentation
- Afternoon: Final testing and review

---

## Rollback Plan

If any phase fails:
1. Identify the specific failure point
2. Rollback to last working phase
3. Debug in isolation
4. Re-implement with fixes
5. Re-run all tests from that phase

---

## Notes

- Each phase builds on the previous one
- Testing is integrated at every step
- Early phases focus on core functionality
- Later phases add convenience and optimization
- Documentation happens throughout, not just at the end

This incremental approach ensures:
- Early validation of core concepts
- Quick feedback loops
- Reduced debugging complexity
- Clear progress milestones
- Easy rollback if needed