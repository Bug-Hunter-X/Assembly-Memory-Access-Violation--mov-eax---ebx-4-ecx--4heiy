section .data

buffer times 100 db 0 ; example buffer of 100 bytes

section .text
  global _start

_start:
  ; ... code to initialize ebx and ecx ...

  ; check for valid memory access
  cmp ecx, 25 ; check if ecx is within the buffer's size (100 bytes/4 bytes per element)
  jg error_handler ; jump to error handler if ecx is too large

  mov eax, [ebx+4*ecx] ; access memory ONLY if bounds are checked
  ; ... further code ...

jmp exit_program

error_handler:
  ; handle the memory access error (e.g. display an error message or exit gracefully)
  mov eax, 1 ; sys_exit
  xor ebx, ebx ; exit code 0
  int 0x80

exit_program:
  mov eax, 1 ; sys_exit
  xor ebx, ebx ; exit code 0
  int 0x80