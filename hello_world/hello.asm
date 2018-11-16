[bits 32]

global main

extern printf
extern exit

section .text
main:
  push msg
  push fmt 
  
  call printf ; printf(fmt, msg)
  add esp, 8 ; clear stack   


  xor eax, eax ; return 0 
  push eax 
  call exit  ; exit



section .data
msg db "Text: %s ", 0
fmt db  "Hello world", 0xa 
