cmake_minimum_required(VERSION 3.20)
project(${PROJECT} LANGUAGES C)
add_library(square)
target_sources(square PRIVATE square.c square.h)
