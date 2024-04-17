LD_LIBRARY_PATH+=:/opt/si/emu/users/soummya/tools/gcc/gcc-10.1.0/lib
LD_LIBRARY_PATH+=:/opt/si/emu/users/soummya/tools/gcc/gcc-10.1.0/lib64
all: clean
	cmake \
		-B build \
		-G "Unix Makefiles" \
		-D CMAKE_EXPORT_COMPILE_COMMANDS=ON \
		-D DUMP_OBJ=ON \
		-D CMAKE_TOOLCHAIN_FILE=toolchain/clang.cmake
	cmake --build build --target lpc

clean:
	rm -rf build .cache
# vim: ts=3 sts=3 sw=3 et
