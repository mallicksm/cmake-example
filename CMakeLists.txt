cmake_minimum_required(VERSION 3.20)
project(lpc LANGUAGES C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(APP app)
set(LIBRARIES shape square)

add_executable(${APP})
target_sources(${APP} PRIVATE "app.c")

target_include_directories(${APP} PRIVATE "${PROJECT_SOURCE_DIR}/square")
target_include_directories(${APP} PRIVATE "${PROJECT_SOURCE_DIR}/shape")
target_link_libraries(${APP} shape)
target_link_libraries(${APP} square)
add_subdirectory("shape")
add_subdirectory("square")
