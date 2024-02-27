PATH=$PATH:~/riscv-gnu-toolchain/rv32i/bin

riscv32-unknown-elf-gcc -ffreestanding -nostartfiles -nostdlib -march=rv32i -mabi=ilp32 -Tlink.ld -oblinky_fast.elf blinky_fast.c 
riscv32-unknown-elf-objcopy -O ihex blinky_fast.elf blinky_fast.ihex

#riscv32-unknown-elf-gcc -nostartfiles -nostdlib -march=rv32i -mabi=ilp32 -Tlink.ld -oblinky_fast.elf blinky_fast.S
#riscv32-unknown-elf-objcopy -O binary blinky_fast.elf blinky_fast.bin

riscv32-unknown-elf-objcopy -O binary blinky_fast.elf blinky_fast.bin
cat blinky_fast.ihex |sed -n 's#^:......00\(.*\)...$#\1#p' |sed 's/......../&\n/g' | sed '/^$/d' | \
    sed 's/\(..\)\(..\)\(..\)\(..\)/\4\3\2\1/' | awk '{print tolower($0)}' |tee blinky_fast.hex


