#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

BUILD_TYPE=release
SHARED_LIBARY_NAME=libreqwest.dylib
BUILD_OUTPUT_DIR=target/$BUILD_TYPE

pushd "$WORKSPACE_DIR"

# build shared library with Cargo
cargo build --$BUILD_TYPE

# Create a variable with the name of the framework
FRAMEWORK_NAME=lv_reqwest_64

./scripts/bundle_framework.sh

# Copy .framework into lv_src dir, overwriting existing
rm -rf "lv_src/$FRAMEWORK_NAME.framework"
cp -R "target/$BUILD_TYPE/$FRAMEWORK_NAME.framework" "lv_src/"

# Zip the framework, overwriting existing
rm -f "lv_src/$FRAMEWORK_NAME.zip"
zip -r "lv_src/$FRAMEWORK_NAME.zip" "lv_src/$FRAMEWORK_NAME.framework"

popd