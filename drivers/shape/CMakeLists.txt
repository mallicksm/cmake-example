cmake_minimum_required(VERSION 3.20)
project(${PROJECT} LANGUAGES C)

add_library(shape)
target_sources(shape PRIVATE shape.c shape.h)
