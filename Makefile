all: clean
	cmake -B build -G "Unix Makefiles" .
	cmake --build build --target lpc

clean:
	rm -rf build .cache
