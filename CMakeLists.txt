cmake_minimum_required(VERSION 3.20)
project(lpc LANGUAGES C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(APP app)
set(LIBRARIES shape square)

add_executable(${APP})
target_sources(${APP} PRIVATE app.c)

FOREACH(LIB ${LIBRARIES})
   target_include_directories(${APP} PRIVATE ${PROJECT_SOURCE_DIR}/drivers/${LIB})
   add_subdirectory(drivers/${LIB})
   target_link_libraries(${APP} ${LIB})
ENDFOREACH()
