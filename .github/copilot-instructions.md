# reqwest-rs-labview

A Rust FFI library that wraps the reqwest HTTP client for use in LabVIEW applications. It builds shared libraries (.dll, .so, .framework) that LabVIEW can call via the Call Library Function Node.

**Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.**

## Working Effectively

### Bootstrap and Dependencies
- **Install system dependencies on Linux**:
  ```bash
  sudo apt-get update -y
  sudo apt-get install -y pkg-config libssl-dev
  ```
- **Install Rust toolchain** (if not present):
  ```bash
  curl --proto '=https' --tlsv1.2 -sSf https://rustup.rs/sh.sh | sh
  source ~/.cargo/env
  ```
- **Install build tools**:
  ```bash
  cargo install just                    # Task runner for build scripts
  pip3 install ziglang                  # Required for cross-compilation
  cargo install cargo-zigbuild          # Cross-compilation tool
  ```

### Build Commands
- **Build for local platform** (release mode):
  ```bash
  cargo build --release
  # Output: target/release/libreqwest_dll.so (Linux)
  # Takes 2-3 minutes. NEVER CANCEL. Set timeout to 5+ minutes.
  ```
- **Debug build** (faster compilation, larger binary):
  ```bash
  cargo build
  # Output: target/debug/libreqwest_dll.so (Linux)
  # Takes ~20 seconds. Use for development/testing.
  ```
- **Cross-compile for Linux x86_64**:
  ```bash
  rustup target add x86_64-unknown-linux-gnu
  cargo zigbuild --target=x86_64-unknown-linux-gnu --release
  # Takes ~45 seconds. Set timeout to 2+ minutes.
  ```
- **Build for Windows** (requires Windows or cross-compilation setup):
  ```bash
  rustup target add i686-pc-windows-msvc x86_64-pc-windows-msvc
  cargo build --target=i686-pc-windows-msvc --release    # 32-bit
  cargo build --target=x86_64-pc-windows-msvc --release  # 64-bit
  ```

### Just Task Runner
The repository includes a `justfile` with build automation:
```bash
just --list    # Show available recipes
```
**NOTE**: The justfile is designed for PowerShell on Windows. On Linux, use the direct cargo commands shown above instead.

### Testing
- **Run the test suite**:
  ```bash
  cargo test
  # Takes 1-2 minutes. NEVER CANCEL. Set timeout to 5+ minutes.
  # NOTE: Integration tests may fail in network-restricted environments due to httpbin.org dependencies
  ```
- **Run tests without network-dependent integration tests**:
  ```bash
  cargo test --lib
  ```

### Code Quality and Linting
- **Format code** (ALWAYS run before committing):
  ```bash
  cargo fmt
  ```
- **Check formatting**:
  ```bash
  cargo fmt --check
  ```
- **Run linter** (expect FFI-related warnings - these are normal):
  ```bash
  cargo clippy --all-targets --all-features
  # NOTE: Clippy will show warnings about unsafe pointer operations in FFI code - these are expected and normal
  ```

## Validation Scenarios

After making changes to the Rust code, ALWAYS:

1. **Build successfully**: `cargo build --release` must complete without errors
2. **Format code**: `cargo fmt` must run clean  
3. **Test core functionality**: Unit tests should pass (`cargo test --lib`)
4. **Cross-compile test**: Verify cross-compilation still works with `cargo zigbuild`
5. **Check library output**: Verify shared library is generated in `target/release/`
6. **Validate FFI exports**: Check that required FFI functions are exported:
   ```bash
   nm -D target/release/libreqwest_dll.so | grep -E "client_|request_|headers_" | head -5
   # Should show exported C functions like client_builder_create, etc.
   ```

### Complete User Scenario Testing
ALWAYS test these complete scenarios after making changes:

1. **Library Creation and Cleanup**:
   - Create a client builder with `client_builder_create()`
   - Configure it with timeout and other settings
   - Build a client with `client_builder_create_client_and_start()`
   - Clean up with `client_destroy()` and `client_builder_destroy()`

2. **Request Building and Execution**:
   - Create a request builder from a client
   - Configure request headers, body, auth, etc.
   - Send request asynchronously
   - Monitor progress and read response
   - Clean up request resources

3. **Header Management**:
   - Create header maps with `headers_create()`
   - Add multiple headers with `headers_add()`
   - Retrieve all headers with `headers_get_all()`
   - Clean up with `headers_destroy()`

### Functional Validation Test
Run this simple C program test to validate basic FFI functionality:
```c
// Save as test_ffi.c and compile with: gcc test_ffi.c -ldl -o test_ffi
#include <stdio.h>
#include <dlfcn.h>

int main() {
    void *handle = dlopen("./target/release/libreqwest_dll.so", RTLD_LAZY);
    if (!handle) return 1;
    
    void* (*create)() = dlsym(handle, "client_builder_create");
    void (*destroy)(void*) = dlsym(handle, "client_builder_destroy");
    
    if (!create || !destroy) { dlclose(handle); return 1; }
    
    void* builder = create();
    if (builder == NULL) { dlclose(handle); return 1; }
    
    printf("PASS: FFI functions working correctly\n");
    destroy(builder);
    dlclose(handle);
    return 0;
}
```

### Manual Testing with LabVIEW (if available)
- The built shared libraries are consumed by LabVIEW via the Call Library Function Node
- LabVIEW code is in `lv_src/` directory with `.vi`, `.lvproj`, and `.lvlib` files
- Pre-built libraries are included: `lv_reqwest_32.dll`, `lv_reqwest_64.dll`, `lv_reqwest_64.so`, `lv_reqwest_64.framework.zip`
- Test VI: `lv_src/test_client.vi` can be used to validate functionality
- Example VI: `lv_src/Examples/Example - Download with Progress and Abort (RUST).vi` demonstrates library usage

## Repository Structure

### Key Directories
- `src/`: Rust source code for the FFI library
  - `ffi/`: C-compatible FFI function implementations
  - `lib.rs`: Main library entry point and exports
  - `types.rs`: Rust type definitions used in FFI
  - `globals.rs`: Global state management for async operations
- `lv_src/`: LabVIEW source code and pre-built libraries
- `tests/`: Integration tests (require network access)
- `docs/`: Developer and user documentation

### Important Files
- `Cargo.toml`: Rust project configuration - builds as both `cdylib` and `rlib`
- `justfile`: Build automation (PowerShell-based, designed for Windows)
- `.github/workflows/rust.yml`: CI/CD pipeline for building multi-platform libraries
- `mac_build.sh` & `bundle_framework.sh`: macOS-specific build scripts

## Common Tasks

### Building Multi-Platform Libraries
The repository supports building for multiple platforms:
- **Windows**: i686 and x86_64 (32-bit and 64-bit .dll files)
- **Linux**: x86_64 (.so file)  
- **macOS**: x86_64 and aarch64 (.framework bundle)

### Cross-Platform Build Process
1. **CI Pipeline**: Uses GitHub Actions with matrix builds on ubuntu-latest, windows-latest, macos-latest
2. **Local Development**: Use `cargo zigbuild` for cross-compilation on Linux
3. **Output Naming**: Libraries are renamed to `lv_reqwest_[32|64].[dll|so]` format

### Working with FFI Code
- **Memory Management**: Follows strict "creator destroys" pattern - if you create it, you must destroy it
- **String Handling**: Uses C-style strings (CString/CStr) for LabVIEW compatibility
- **Error Handling**: Two-tier system - configuration errors vs transport errors
- **Async Operations**: Built on tokio runtime, hidden from LabVIEW callers
- **Thread Safety**: Global runtime and thread-safe data structures manage concurrent operations
- **Pointer Safety**: FFI functions use unsafe pointer operations - clippy warnings are expected and normal

### Common Development Workflows

#### Adding a new FFI function:
1. Add function signature to appropriate module in `src/ffi/`
2. Add `#[unsafe(no_mangle)]` and `pub extern "C"` decorators
3. Add to exports in `src/lib.rs`
4. Build and test: `cargo build --release && cargo test --lib`
5. Format: `cargo fmt`
6. Validate FFI export: `nm -D target/release/libreqwest_dll.so | grep your_function`

#### Modifying existing functionality:
1. Make minimal changes to Rust code
2. Build: `cargo build --release`
3. Run validation tests (see Validation Scenarios section)
4. Update corresponding LabVIEW VIs if FFI signatures changed
5. Format: `cargo fmt`

## Troubleshooting

### Common Build Issues
- **SSL/TLS errors**: Ensure `pkg-config` and `libssl-dev` are installed on Linux
- **Cross-compilation failures**: Verify `ziglang` and `cargo-zigbuild` are properly installed
- **Test failures**: Integration tests require internet access - use `cargo test --lib` for offline testing

### Development Tips
- **FFI Safety**: Be careful with pointer operations - the existing clippy warnings are expected for FFI code
- **Async Runtime**: The library manages a global tokio runtime - don't create additional runtimes
- **LabVIEW Integration**: Changes to FFI signatures require updates to corresponding LabVIEW VIs
- **Platform Testing**: Test library loading in LabVIEW on target platform when possible

### Build Time Expectations
- **Initial clean build (release)**: 2-3 minutes (downloads and compiles all dependencies)
- **Initial clean build (debug)**: 15-20 seconds (much faster, unoptimized)  
- **Incremental builds**: 2-10 seconds for small changes
- **Cross-compilation (initial)**: ~45 seconds after dependencies are built
- **Cross-compilation (incremental)**: ~10 seconds for small changes  
- **Test suite**: 1-2 minutes (longer in network-restricted environments)
- **Unit tests only**: ~2 seconds (use `cargo test --lib`)
- **Formatting**: < 1 second (`cargo fmt`)
- **Clippy linting**: 20-30 seconds for full check

**CRITICAL TIMING NOTES:**
- NEVER CANCEL builds or tests that appear to hang - Rust compilation can take several minutes
- Always set timeouts to 5+ minutes for `cargo build --release` (first build)
- Set timeouts to 1+ minutes for `cargo build` (debug builds)
- Set timeouts to 2+ minutes for `cargo zigbuild` (first cross-compile)
- Set timeouts to 5+ minutes for `cargo test` (includes network-dependent integration tests)
- Set timeouts to 1+ minutes for `cargo clippy --all-targets --all-features`