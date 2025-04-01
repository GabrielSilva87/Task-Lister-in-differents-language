sudo apt-get install nasm
nasm -f elf32 todo.asm -o todo.o
ld -m elf_i386 -s -o todo todo.o
./todo