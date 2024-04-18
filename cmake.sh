#!/bin/bash
rm -rf build .cache
cmake --preset=default -G "Unix Makefiles"
cmake --build --preset=default
