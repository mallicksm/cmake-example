cmake_minimum_required(VERSION 3.20)
project(lpc LANGUAGES C)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(APP lpc)

add_executable(${APP})
add_subdirectory(kernel)

set(LIBS shape square)
FOREACH(LIB ${LIBS})
   target_include_directories(${APP} PRIVATE drivers/${LIB})
   add_subdirectory(drivers/${LIB})
   target_link_libraries(${APP} ${LIB})
ENDFOREACH()
