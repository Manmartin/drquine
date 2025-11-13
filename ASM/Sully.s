global main
extern sprintf
extern fopen
extern fprintf
extern fclose
extern system

%define i 5
section .note.GNU-stack
section .bss
    execname: resb 17
    filename: resb 19
    command: resb 200

section .data
    str: db "global main%1$cextern sprintf%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cextern system%1$c%1$c%%define i %4$i%1$csection .note.GNU-stack%1$csection .bss%1$c    execname: resb 17%1$c    filename: resb 19%1$c    command: resb 200%1$c%1$csection .data%1$c    str: db %2$c%3$s%2$c, 0%1$c    exec_format: db %2$cSully_%%i%2$c, 0%1$c    file_format: db %2$c%%s.s%2$c, 0%1$c    command_format: db %2$cnasm -DCHILD -f elf64 %%1$s -o %%2$s.o; gcc -no-pie %%2$s.o -o %%2$s; rm %%2$s.o; ./%%2$s%2$c, 0%1$c    w: db %2$cw%2$c, 0%1$c%1$csection .text%1$cmain:%1$c    push rbp%1$c%1$c    mov r13, i%1$c    cmp r13, 0%1$c    jle _return%1$c    %%ifdef CHILD%1$c    dec r13%1$c    %%endif%1$c%1$c    mov rdi, execname%1$c    mov rsi, exec_format%1$c    mov rdx, r13%1$c    call sprintf%1$c%1$c    mov rdi, filename%1$c    mov rsi, file_format%1$c    mov rdx, execname%1$c    call sprintf%1$c%1$c    mov rdi, command%1$c    mov rsi, command_format%1$c    mov rdx, filename%1$c    mov rcx, execname%1$c    call sprintf%1$c%1$c    mov rdi, filename%1$c    mov rsi, w%1$c    call fopen%1$c    cmp rax, 0%1$c    je _error%1$c    mov r12, rax%1$c%1$c    mov rdi, r12%1$c    mov rsi, str%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    mov r8, str%1$c    mov r9, r13%1$c    call fprintf%1$c%1$c    mov rdi, r12%1$c    call fclose%1$c%1$c    mov rdi, command%1$c    call system%1$c%1$c_return:%1$c    pop rbp%1$c    xor rax, rax%1$c    ret%1$c_error:%1$c    mov rdi, 1%1$c    mov rax, 60%1$c    syscall%1$c", 0
    exec_format: db "Sully_%i", 0
    file_format: db "%s.s", 0
    command_format: db "nasm -DCHILD -f elf64 %1$s -o %2$s.o; gcc -no-pie %2$s.o -o %2$s; rm %2$s.o; ./%2$s", 0
    w: db "w", 0

section .text
main:
    push rbp

    mov r13, i
    cmp r13, 0
    jle _return
    %ifdef CHILD
    dec r13
    %endif

    mov rdi, execname
    mov rsi, exec_format
    mov rdx, r13
    call sprintf

    mov rdi, filename
    mov rsi, file_format
    mov rdx, execname
    call sprintf

    mov rdi, command
    mov rsi, command_format
    mov rdx, filename
    mov rcx, execname
    call sprintf

    mov rdi, filename
    mov rsi, w
    call fopen
    cmp rax, 0
    je _error
    mov r12, rax

    mov rdi, r12
    mov rsi, str
    mov rdx, 10
    mov rcx, 34
    mov r8, str
    mov r9, r13
    call fprintf

    mov rdi, r12
    call fclose

    mov rdi, command
    call system

_return:
    pop rbp
    xor rax, rax
    ret
_error:
    mov rdi, 1
    mov rax, 60
    syscall
