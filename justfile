# use PowerShell instead of sh:
set shell := ["pwsh", "-c"]

alias   b   := build
alias   d   := develop

list:
    @ just --list

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

check:
    cargo fmt -- --check
    cargo clippy      

format:
    cargo fmt

develop_windows:                                       
    @ Write-Host "Installing Rust Windows targets..."
    @ rustup target add i686-pc-windows-msvc
    @ rustup target add x86_64-pc-windows-msvc
    @ # test if the cmake command is available
    @ if (Test-Path -Path "C:\Program Files\CMake\bin\cmake.exe") { \
        Write-Host "CMake is installed."; \
    } else { \
        Write-Host "CMake is not installed. Please install CMake from https://cmake.org/download/"; \
    }

develop_linux:
    @ Write-Host "Installing Rust Linux targets..."
    @ rustup target add x86_64-unknown-linux-gnu
    @ Write-Host "Installing cargo-zigbuild..."
    @ cargo install cargo-zigbuild

develop:
    @ just develop_windows
    @ just develop_linux

test:
    cargo test
