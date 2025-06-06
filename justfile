# use PowerShell instead of sh:
set shell := ["pwsh", "-c"]

alias   b   := build
alias   d   := develop

build_32:
    cargo build --target=i686-pc-windows-msvc --release
    Copy-Item -Force -Path "target\i686-pc-windows-msvc\release\*.dll" -Destination "lv_src\lv_reqwest_32.dll"

build_64:
    cargo build --target=x86_64-pc-windows-msvc --release
    Copy-Item -Force -Path "target\x86_64-pc-windows-msvc\release\*.dll" -Destination "lv_src\lv_reqwest_64.dll"

build_windows:
    just build_32
    just build_64

build_linux:
    cargo zigbuild --target=x86_64-unknown-linux-gnu --release
    Copy-Item -Force -Path "target\x86_64-unknown-linux-gnu\release\*.so" -Destination "lv_src\lv_reqwest_64.so"

build:
    just build_windows
    just build_linux

develop_windows:                                            
    rustup target add i686-pc-windows-msvc
    rustup target add x86_64-pc-windows-msvc

develop_linux:
    rustup target add x86_64-unknown-linux-gnu
    cargo install cargo-zigbuild

develop:
    just develop_windows
    just develop_linux

test:
    cargo test
