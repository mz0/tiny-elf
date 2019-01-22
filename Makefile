hello: hello.o Makefile
	ld.lld -o hello hello.o
	strip -R '!.text' -R '!.rodata' -R '.*' hello

tiny: tiny.asm Makefile
	nasm -f bin -o tiny tiny.asm
	chmod +x tiny
	@echo "Run:\n ./tiny ; echo $$ \b? ; wc -c tiny"

hello-gnu: hello.o
	ld -o hello hello.o

hello.o: hello.asm
	nasm -f elf64 -o hello.o hello.asm

helloc: helloc.o stubstart.o Makefile
	ld.lld -o helloc helloc.o stubstart.o
	strip -R .eh_frame -R .comment -R .data -R .bss helloc

helloc.o: hello.c Makefile
	gcc -c -nostdlib -fomit-frame-pointer -o helloc.o hello.c

stubstart.o: stubstart.S
	gcc -c -nostdlib  -o stubstart.o stubstart.S

helloc-gnu: hello.c stubstart.S
	gcc -nostdlib stubstart.S -o helloc hello.c

clean:
	rm -f hello *.o helloc
