all:
	clang -c --target=aarch64-none-elf kernel64/entry.S -o entry.o
	clang -c --target=aarch64-none-elf kernel64/start.c -o start.o
	clang --target=aarch64-none-elf -fuse-ld=lld \
		-Wl,-Map,lpc.map \
		-nostdlib \
		-e _entry \
		-T kernel64/SRAM.ld \
		entry.o start.o -o lpc.elf
	llvm-objdump -drSt lpc.elf > lpc.S
clean:
	rm -rf entry.o start.o lpc.elf lpc.S lpc.map
# vim: ts=3 sts=3 sw=3 et
