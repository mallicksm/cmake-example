cmake_minimum_required(VERSION 3.20)
project(${PROJECT} LANGUAGES C)

target_sources(${APP} PRIVATE entry.S start.c)

set(LIBS shape square)
FOREACH(LIB ${LIBS})
   target_link_libraries(${APP} ${LIB})
ENDFOREACH()
