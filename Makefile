all: clean
	@cmake \
      -G "Unix Makefiles" \
      --preset default
	@cmake \
      --build \
      --preset default

clean:
	@rm -rf build .cache
# vim: ts=3 sts=3 sw=3 et
