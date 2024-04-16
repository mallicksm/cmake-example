cmake_minimum_required(VERSION 3.20)
project(geometries LANGUAGES C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(app)
target_sources(app PRIVATE "app.c")
target_include_directories(app PRIVATE "${PROJECT_SOURCE_DIR}")
target_include_directories(app PRIVATE "${PROJECT_SOURCE_DIR}/square")
target_include_directories(app PRIVATE "${PROJECT_SOURCE_DIR}/shape")
target_link_libraries(app shape)
target_link_libraries(app square)
add_subdirectory("shape")
add_subdirectory("square")
install(TARGETS app)


