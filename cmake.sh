#!/bin/bash
BUILD_DIR=build
rm -rf $BUILD_DIR
cmake -B $BUILD_DIR --preset=x86
cmake --build $BUILD_DIR --preset=x86
