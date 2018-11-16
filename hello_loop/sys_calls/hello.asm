[bits 32]

global _start

section .text
_start: 
  mov edi, 3 ; index = 3
 
loop:
   mov eax, 0x04 ; set sys_write
   mov ebx, 1 ; arg1 -> write to stdout 
   mov ecx, msg ; arg2 -> msg
   mov edx, len ; arg3 -> size
   int 0x80 ; call kernel 
   mov eax, edi
   dec eax 
   mov edi, eax
   jnz loop 

done: 
   mov eax, 0x01 ; set sys_exit
   xor ebx, ebx 
   int 0x80


section .data
msg db "Hello world", 0xa, 0
len equ $ - msg 

