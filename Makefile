hello: hello.o
	ld -o hello hello.o

hello.o: hello.asm
	nasm -f elf64 -o hello.o hello.asm

helloc: hello.c stubstart.S
	gcc -nostdlib stubstart.S -o helloc hello.c

clean:
	rm -f hello hello.o
