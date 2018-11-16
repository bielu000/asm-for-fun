[bits 32]

global main

extern printf 
extern exit 

section .text
main:
  mov ebx, 3 ; loop index

loop:
  push msg
  push fmt 
  call printf ; call printf(fmt, msg) 
  add esp, 8 ; claer stack 
  mov eax, ebx 
  dec eax
  mov ebx, eax 
  jnz loop ; loop if eax != 0 
  
done:
  xor eax, eax
  push eax
  call exit ; exit(0);



section .data
fmt db "%s", 0
msg db "Hello world", 0xa, 0



