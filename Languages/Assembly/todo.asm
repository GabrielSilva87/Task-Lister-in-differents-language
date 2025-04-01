section .bss
    task resb 100
    tasks resb 1000
    count resb 1

section .text
    global _start

_start:
    mov byte [count], 0

input_task:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_input
    mov edx, msg_input_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, task
    mov edx, 100
    int 0x80

    mov eax, [count]
    mov [tasks + eax * 100], task
    inc byte [count]

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_continue
    mov edx, msg_continue_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, task
    mov edx, 1
    int 0x80

    cmp byte [task], 'y'
    je input_task

    mov eax, 4
    mov ebx, 1
    mov ecx, msg_list
    mov edx, msg_list_len
    int 0x80

    mov ecx, 0
list_tasks:
    mov eax, [count]
    cmp ecx, eax
    jge exit

    mov eax, 4
    mov ebx, 1
    mov edx, 100
    mov esi, [tasks + ecx * 100]
    int 0x80

    inc ecx
    jmp list_tasks

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80

section .data
msg_input db "Insira uma tarefa: ", 0
msg_input_len equ $ - msg_input
msg_continue db "Deseja adicionar outra tarefa? (y/n): ", 0
msg_continue_len equ $ - msg_continue
msg_list db "Lista de Tarefas:", 10, 0
msg_list_len equ $ - msg_list