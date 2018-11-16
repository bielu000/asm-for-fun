[bits 32]

section .data
 tab times 12 dw 0 
 tabElements dw 0x03 
 msg db 'Enter number: '
 msgLen equ $ - msg 
 msgOut db 'You have entered: ', 0xa
 msgOutLen equ $ - msgOut 
 

section .text
global _start

_start: 
  mov edi, tab
  mov dword esi, 3 ; set elements  

read_loop:
  mov ebx, 0x01 ; write to stdout 
  mov ecx, msg ; set print msg 
  mov edx, msgLen ; 
  mov eax, 0x04 ; call sys_write 
  int 0x80 

  mov ebx, 0x00 ; read from stdin
  mov ecx, edi ; buffer to write 
  mov edx, 0x04 ; set size 4 bytes 
  mov eax, 0x03 ; call sys_read 
  int 0x80 ; call kernel 
 	
  add edi, 4 ; edi = edi + 4 -> next element on array  
  dec esi ;  ; index-- 
  mov eax, esi ; 
  jnz read_loop ; check index == 0 

print: ; prints output_message without numbers 
  mov ebx, 0x01 ; set output to stdout 
  mov ecx, msgOut ; show output message 
  mov edx, msgOutLen ; outputMessage len 
  mov eax, 0x04 ; call sys_write 
  int 0x80 ; call kernel
  
  mov esi, 3; set max elements 
  mov edi, tab ; edi = &tab; 

print_loop:  
  mov ebx, 0x01 ; set output to stdout 
  mov ecx, edi ; set bufffer to output
  mov edx, 0x04 ; sizeof(int) -> 4 bytes 
  mov eax, 0x04 ; call sys_write 
  int 0x80 ; call kernel 
 
  add edi, 4 ; edi += 4; move pointer 
  dec esi ; esi-- 
  mov eax, esi 
  jnz print_loop 
  

exit: 
 xor ebx, ebx ; set return 0 
 mov eax, 0x01; call sys_exit
 int 0x80 ; call kernel 
