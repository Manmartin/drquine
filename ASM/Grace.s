; Mi unico comentario
extern fopen
extern fprintf
extern fclose
global main

%define STR "; Mi unico comentario%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cglobal main%1$c%1$c%%define STR %2$c%3$s%2$c, 0%1$c%%define FILE_NAME %2$cGrace_kid.s%2$c, 0%1$c%%macro START 0%1$csection .text%1$cmain:%1$cpush rbp%1$cmov rdi, file_name%1$cmov rsi, w%1$ccall fopen%1$ccmp rax, 0%1$cje _error%1$cmov r12, rax%1$c%1$cmov rdi, rax%1$cmov rsi, str%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, str%1$ccall fprintf%1$c%1$cmov rdi, r12%1$ccall fclose%1$c%1$cpop rbp%1$cxor rax, rax%1$cret%1$c%1$c_error:%1$cmov rax, 60%1$cmov rdi, 1%1$csyscall%1$c%%endmacro%1$c%1$csection .data%1$c    str: db STR%1$c    file_name: db FILE_NAME%1$c    w: db %2$cw%2$c, 0%1$c%1$cSTART%1$c", 0
%define FILE_NAME "Grace_kid.s", 0
%macro START 0
section .text
main:
push rbp
mov rdi, file_name
mov rsi, w
call fopen
cmp rax, 0
je _error
mov r12, rax

mov rdi, rax
mov rsi, str
mov rdx, 10
mov rcx, 34
mov r8, str
call fprintf

mov rdi, r12
call fclose

pop rbp
xor rax, rax
ret

_error:
mov rax, 60
mov rdi, 1
syscall
%endmacro

section .data
    str: db STR
    file_name: db FILE_NAME
    w: db "w", 0

START
