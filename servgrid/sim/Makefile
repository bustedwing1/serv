#TOOLCHAIN_PREFIX=riscv64-unknown-elf-
TOOLCHAIN_PREFIX=/opt/riscv/bin/riscv32-unknown-linux-gnu-
%.elf: %.S link.ld
	$(TOOLCHAIN_PREFIX)gcc -nostartfiles -nostdlib -march=rv32i -mabi=ilp32 -Tlink.ld -o$@ $<
%.bin: %.elf
	$(TOOLCHAIN_PREFIX)objcopy -O binary $< $@
%.hex: %.bin
	python3 makehex.py $< > $@

clean:
	rm -f *.elf *.bin *.hex
