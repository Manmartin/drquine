extern printf
global main

; Comentario fuera de main
section .data
str: db "extern printf%1$cglobal main%1$c%1$c; Comentario fuera de main%1$csection .data%1$cstr: db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cprint_it:%1$cmov rdi, str%1$cmov rsi, 10%1$cmov rdx, 34%1$cmov rcx, str%1$ccall printf%1$cret%1$c%1$cmain:%1$c; Comentario dentro de main%1$ccall print_it%1$cxor rax, rax%1$cret%1$c", 0

section .text
print_it:
mov rdi, str
mov rsi, 10
mov rdx, 34
mov rcx, str
call printf
ret

main:
; Comentario dentro de main
call print_it
xor rax, rax
ret
