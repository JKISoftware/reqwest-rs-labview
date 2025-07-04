# reqwest-rs-labview

A LabVIEW HTTP client that calls a DLL-wrapper around the [reqwest](https://crates.io/crates/reqwest) library (the most popular high-level HTTP client library for Rust).

It (`reqwest-rs-labview`) was originally built to meet the following requirements:

- **Asynchronous & Fast** - library supports concurrent downloads/requests to happen in parallel and should be performant
- **Cross-platform** - library can compile/run on all platform supported by LabVIEW, including NI Linux RT (tested on RT PXI and cRIO x64)
- **Maintainable** - engineers using the LabVIEW code with some text-based programming experience should be able to understand and maintain the DLL codebase.

## Using this Library

**Clone/Download the Repo (no VI Package yet)**

Right now, there is no VI Package for installing the library, so you will need to clone/download this repo into your project -- it's being used successfully on some internal JKI projects and is added to the project as a git submodule.

The examples and everything should run "out of the box" after cloning this repo, since the built shared libraries are included along-side the LabVIEW project -- there are 32-bit and 64-bit DLLs for Windows and a 64-bit DLL for Linux.

**Using LabVIEW RT? Copy the .so onto the RT target**

Note that if you're using **LabVIEW RT** on an RT PXI or cRIO you will need to copy the `lv_reqwest_64.so` file into the `/usr/lib64/` directory on your RT target using an sftp or other file transfer tool.

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

## Open Issues and Questions

- SSL/TLS choice -- there are several options for which SSL/TLS/Crypto library to use [rust-native-tls](https://github.com/sfackler/rust-native-tls) (system-native TLS) or [rustls](https://github.com/rustls/rustls) and which certs to bundle (or not).  For linux in particular, this may involve needing to recompile the DLL on the target machine, but we would need to test that.

## Roadmap

- See [./docs/ROADMAP.md](docs/ROADMAP.md)
