all:
	clang -c --target=aarch64-none-elf kernel64/entry.S -o entry.o
	clang -c --target=aarch64-none-elf kernel64/start.c -o start.o
	clang --target=aarch64-none-elf -fuse-ld=lld \
		-e _entry \
		-fno-builtin \
		-nostdlibinc \
		-ffreestanding \
		-nostdlib \
		-T kernel64/sram.ld \
		entry.o start.o -o lpc.elf
	llvm-objdump --disassemble lpc.elf > lpc.S
# vim: ts=3 sts=3 sw=3 et
