; Compile this program using
; nasm -f elf64 static_lib.asm 
; gcc myprogram.c static_lib.o
; ./a.out

SECTION .DATA
	hello:     db 'Hello world!',10
	helloLen:  equ $-hello

SECTION .TEXT
	GLOBAL print_hello

print_hello:
	mov eax,4            ; 'write' system call = 4
	mov ebx,2            ; file descriptor 1 = STDOUT
	mov ecx,hello        ; string to write
	mov edx,helloLen     ; length of string to write
	int 80h              ; call the kernel

	; Terminate program
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel
