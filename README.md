# reqwest-rs-labview

A comprehensive LabVIEW HTTP client library built around the production-quality [reqwest](https://crates.io/crates/reqwest) Rust library (the most popular high-level HTTP client library for Rust). The LabVIEW bindings are currently being stabilized and have been successfully used in multiple JKI projects.

## Key Features

- **✅ Mature & Stable** - Built on the production-quality reqwest Rust library with LabVIEW bindings that are being stabilized
- **✅ Asynchronous & Fast** - Non-blocking concurrent requests with real-time progress tracking
- **✅ Cross-platform** - Windows (32/64-bit), Linux (64-bit), and macOS with pre-built binaries
- **✅ Feature Complete** - Comprehensive HTTP client with all major features implemented:
  - All HTTP methods (GET, POST, PUT, DELETE) with full customization
  - Client builder pattern with timeouts, SSL control, proxy support
  - Authentication (Basic, Bearer token)
  - Request/response header manipulation
  - Query parameters and form data
  - File uploads and downloads
  - Progress tracking and cancellation
- **✅ Native LabVIEW Integration** - 70+ VIs providing a familiar LabVIEW programming experience
- **✅ Maintainable** - Clean Rust codebase with comprehensive FFI layer

## Using this Library

**Ready to Use - Pre-built Binaries Included**

This library is ready for immediate use! Pre-built shared libraries are included for all supported platforms:
- Windows: `lv_reqwest_32.dll` and `lv_reqwest_64.dll`
- Linux: `lv_reqwest_64.so`
- macOS: `lv_reqwest_64.framework` (see extraction instructions below)

**Installation Options:**

1. **Clone/Download** - Add this repo as a git submodule to your project for the latest updates
2. **Direct Download** - Download and extract the repo into your project directory
3. **Future:** VI Package installation (planned for easier distribution)

**Platform-Specific Setup:**

- **Windows & Linux:** Ready to use - no additional setup required
- **LabVIEW RT (Linux):** Copy `lv_reqwest_64.so` to `/usr/lib64/` on your RT target using sftp or file transfer tool
- **macOS:** Extract `lv_src/lv_reqwest_64.framework.zip` to create the `lv_src/lv_reqwest_64.framework` bundle, or build it yourself using the `./mac_build.sh` script

## Quick Start Examples

The `lv_src/Examples/` directory contains working examples demonstrating:
- Basic GET/POST requests
- Authentication (Basic and Bearer token)  
- File uploads and downloads with progress tracking
- Request customization (headers, query parameters)
- Error handling and response processing

## Design Strategy

- **Thin DLL Wrapper** - Expose the reqwest API via a thin wrapper DLL (keep complexity out of the DLL, as much as possible, unless it's critical for achieving **asynchronous** and **fast**)
  - Benefits:
    - Less Rust code to maintain, in theory, assuming (A) the surface area of the library's API isn't too large, (B) the library API doesn't change, and (C) it's straight-forward to wrap (deal with the async runtime, etc.).  
    - The [reqwest library documention](https://docs.rs/reqwest/latest/reqwest/) can serve as basic documentation for the LabVIEW library
  - Drawbacks:
    - Changes to the reqwest library might drive necessary/breaking changes into the LabVIEW library (since it's not abstracted). However, this doesn't seem like too large of a risk considering the maturity of the reqwest library.
    - The reqwest library expects the caller to provide a tokio async runtime/executor, so this will need to be baked into the DLL and hidden from LabVIEW callers -- it's sort of "the price of admission" to get the async+performance benefits.
    - The reqwest library uses a builder pattern for some things (ClientBuilder, RequestBuilder) which is ergonomic in Rust (allows [method-chaining](https://doc.rust-lang.org/book/ch17-01-futures-and-syntax.html?highlight=chaining#listing-17-2)), but is not as common in LabVIEW and could lead to some confusion around object reference cleanup (since the builder's `build` function consumes/cleans-up the builder reference rather than having an explicit close/free/destroy function).
- **Bake-in the tokio (Rust async engine)** - Hide the tokio runtime engine details from LabVIEW

## Alternative Designs Considered

- Use a different Rust library
  - We looked at different libraries and `reqwest` ticked all the boxes in ways that others didn't.
- Use a C (or other language) library:
  - Rust seems like a great choice for a more modern choice of tooling/language/ecosystem and we've had good success in calling it from LabVIEW (in the [toml-edit-labview](https://github.com/JKISoftware/toml-edit-labview) library).
- Make the DLL interface very simple and similar to the built-in LabVIEW HTTP Client
  - This option moves complexity into the DLL while also making it potentially harder to expose library capabilities and features to LabVIEW. Also, the LabVIEW HTTP Client does not support async downloads (its API doesn't expose request/response objects) so we'd be designing a new LabVIEW API anyway and then trying to design the DLL for calling it -- that feels like two (or more) hard things to do at the same time without much additional benefit.  Plus, we can create a high-level client in LabVIEW with an identical interface as the built-in LabVIEW HTTP Client that calls the `reqwest-rs-labview`, which moves that complexity and maintenance up to the LabVIEW level.

## Current Status & Roadmap

**This library leverages the production-quality reqwest Rust HTTP client with LabVIEW bindings that are currently being stabilized.** The core functionality is feature-complete for most HTTP client use cases. If tested and working reliably on your project, it's very likely to be stable, but care and discretion are advisable given the ongoing stabilization of the LabVIEW integration layer.

- ✅ **Core HTTP Operations:** All methods (GET, POST, PUT, DELETE) with full customization
- ✅ **Advanced Configuration:** Timeouts, SSL, proxy, authentication, headers
- ✅ **Async Operations:** Non-blocking requests with progress tracking and cancellation  
- ✅ **Cross-Platform:** Windows, Linux, macOS with pre-built binaries
- ✅ **LabVIEW Integration:** 70+ VIs providing native LabVIEW experience
- ❌ **Multipart Forms:** File uploads using multipart/form-data (planned enhancement)

See [./docs/ROADMAP.md](docs/ROADMAP.md) for detailed implementation status and future enhancements.
