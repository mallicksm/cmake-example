LD_LIBRARY_PATH+=:/opt/si/emu/users/soummya/tools/gcc/gcc-10.1.0/lib
LD_LIBRARY_PATH+=:/opt/si/emu/users/soummya/tools/gcc/gcc-10.1.0/lib64
all: clean
	@cmake \
      --preset default
	@cmake \
      --build \
      --preset default

clean:
	@rm -rf build .cache
# vim: ts=3 sts=3 sw=3 et
