all:
	clang -c --target=aarch64-none-elf kernel64/entry.S -o entry.o
	clang -c --target=aarch64-none-elf kernel64/start.c -o start.o
# vim: ts=3 sts=3 sw=3 et
