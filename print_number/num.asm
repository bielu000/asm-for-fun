
[bits 32]

section .data
 promptMsg db 'Please enter a number: ' 
 lenPromptMsg equ $ - promptMsg 
 
 info db 'You have entered: '
 lenInfo equ $ - info 

section .bss 
  num resb 5 ; reserve 5 bytes 

section .text
global _start

_start:

hello:
  mov ebx, 1 ; print to stdout
  mov ecx, promptMsg ; message
  mov edx, lenPromptMsg ; messagelen 
  mov eax, 0x04 ; call sys_write 
  int 0x80 ; call kernel 

read:
  mov ebx, 0 ; read from stdin
  mov ecx, num  ; set buffer to read
  mov edx, 5 ; set buffer size
  mov eax, 0x03 ; call sys_read 
  int 0x80 ; call kernel

print:
  mov ebx, 1 ; write to stdout 
  mov ecx, info ; message
  mov edx, lenInfo ; messagelen 
  mov eax, 0x04 ; ; call sys_write 
  int 0x80 ; call kernel 


  mov ebx, 1 
  mov ecx, num 
  mov edx, 5 
  mov eax, 0x04
  int 0x80

exit:
  xor ebx, ebx
  mov eax, 0x01
  int 0x80
