[bits 32]

section .data 
 msg db 'Enter your name: '
 msgLen equ $ - msg
 
 tab times 10 DW 0 
 tabLen equ $ - tab

section .text
global _start

_start: 

info: 
  mov ebx, 0x01 ; write stdout 
  mov ecx, msg ; message
  mov edx, msgLen ; messagelen 
  mov eax, 0x04 ; call sys_write 
  int 0x80 ; call kernel 

read: 
 mov ebx, 0x00 ; read stdin 
 mov ecx, tab ; buffer to write 
 mov edx, tabLen ; sizeof(buffer) 
 mov eax, 0x03 ; call sys_read 
 int 0x80 ; call kernel 

print: 
 mov ebx, 0x01 ; write to stdout 
 mov ecx, tab ; buffer to print
 mov edx, tabLen ; sizeof(buffer) 
 mov eax, 0x04 ; call sys_write 
 int 0x80

exit: 
 xor ebx, ebx ; return 0
 mov eax, 0x01 ; call sys_exit
 int 0x80
