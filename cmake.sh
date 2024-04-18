#!/bin/bash
BUILD_DIR=build
rm -rf $BUILD_DIR
cmake -B $BUILD_DIR --preset=default
cmake --build $BUILD_DIR --preset=default
