#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

LV_SOURCE_DIR=$SCRIPT_DIR/lv_src

BUILD_TYPE=release
SHARED_LIBARY_NAME=libreqwest.dylib
BUILD_OUTPUT_DIR=$SCRIPT_DIR/target/$BUILD_TYPE

# # build shared library with Cargo
# cargo build --$BUILD_TYPE

# Create a variable with the name of the framework
FRAMEWORK_NAME=lv_reqwest_64

# change directory to the one containing shared library
pushd $BUILD_OUTPUT_DIR

# Create the framework directory (and subdirectories)
rm -rf $FRAMEWORK_NAME.framework
mkdir -p $FRAMEWORK_NAME.framework/Versions/A

# Copy the `.dylib` file into the framework as version `A`
cp $SHARED_LIBARY_NAME $FRAMEWORK_NAME.framework/Versions/A/$FRAMEWORK_NAME
chmod ugo+rx $FRAMEWORK_NAME.framework/Versions/A/$FRAMEWORK_NAME

# Create symbolic links to the current version of the framework
ln -s ./A ./$FRAMEWORK_NAME.framework/Versions/Current
ln -s ./Versions/A/$FRAMEWORK_NAME ./$FRAMEWORK_NAME.framework

# Zip the framework
rm -rf $FRAMEWORK_NAME.framework.zip
zip -r $FRAMEWORK_NAME.framework.zip $FRAMEWORK_NAME.framework

# change directory back to the original
popd

# Copy into LabVIEW Source Folder
rm -rf $LV_SOURCE_DIR/$FRAMEWORK_NAME.framework
cp -R $BUILD_OUTPUT_DIR/$FRAMEWORK_NAME.framework $LV_SOURCE_DIR/
