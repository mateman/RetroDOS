nasm -f bin bootloader.asm -o bootloader.bin
nasm -f bin kernel2.asm -o kernel.bin
cat bootloader.bin kernel.bin >main_floppy.img
