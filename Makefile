hello: hello.o
	ld.lld-9 -o hello hello.o

hello-gnu: hello.o
	ld -o hello hello.o

hello.o: hello.asm
	nasm -f elf64 -o hello.o hello.asm

helloc: helloc.o stubstart.o
	ld.lld-9 -o helloc helloc.o stubstart.o

helloc.o: hello.c
	gcc -c -nostdlib  -o helloc.o hello.c

stubstart.o: stubstart.S
	gcc -c -nostdlib  -o stubstart.o stubstart.S

helloc-gnu: hello.c stubstart.S
	gcc -nostdlib stubstart.S -o helloc hello.c

clean:
	rm -f hello *.o helloc
