cmake_minimum_required(VERSION 3.20)
project(lpc LANGUAGES C)

set(APP lpc)

add_executable(${APP})
add_subdirectory(kernel)

set(LIBS shape square)
FOREACH(LIB ${LIBS})
   add_subdirectory(drivers/${LIB})
   target_include_directories(${APP} PRIVATE drivers/${LIB})
ENDFOREACH()
message("${CMAKE_EXE_LINKER_FLAGS}")


add_custom_command(TARGET ${APP} POST_BUILD
   COMMAND ${CMAKE_SIZE} $<TARGET_FILE:${APP}>)

if (${DUMP_OBJ})
add_custom_command(TARGET ${APP} POST_BUILD
   COMMAND ${CMAKE_OBJCOPY} -O ihex $<TARGET_FILE:${APP}> ${APP}.hex
   COMMAND ${CMAKE_OBJCOPY} -O binary $<TARGET_FILE:${APP}> ${APP}.bin
   COMMAND ${CMAKE_OBJDUMP} --disassemble $<TARGET_FILE:${APP}> > ${APP}.S)
endif()
