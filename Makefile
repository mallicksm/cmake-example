all: clean
	cmake -B build -G "Unix Makefiles" .
	cmake --build build

clean:
	rm -rf build .cache
