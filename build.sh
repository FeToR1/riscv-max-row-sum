set -e
mkdir -p build
riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -mcmodel=medany --specs=nano.specs --specs=nosys.specs -Wl,--strip-debug main.c -o build/main.elf
riscv-none-elf-objdump -D build/main.elf > build/main.dump
riscv-none-elf-gcc -march=rv32i -mabi=ilp32 -mcmodel=medany --specs=nano.specs -S main.c -o build/main.compiler.s
