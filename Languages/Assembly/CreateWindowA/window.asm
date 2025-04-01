section .data
    className db "SimpleWindowClass", 0
    windowTitle db "Lista de Tarefas", 0
    msg db "Insira uma tarefa:", 0
    msgLen equ $ - msg

section .bss
    hWnd resd 1
    hEdit resd 1
    buffer resb 256

section .text
    extern GetMessageA, TranslateMessage, DispatchMessageA
    extern CreateWindowExA, ShowWindow, UpdateWindow, GetDlgItemTextA
    extern DefWindowProcA, RegisterClassA, CreateWindowA, MessageBoxA
    extern GetModuleHandleA, LoadIconA, LoadCursorA, PostQuitMessage
    extern GetClientRect, SetWindowPos
    extern GetDC, ReleaseDC, FillRect, CreateSolidBrush
    extern SendMessageA
    global _start

_start:
    invoke GetModuleHandleA, 0
    mov ebx, eax

    ; Register Window Class
    mov eax, [className]
    mov [className + 4], ebx
    mov eax, 0
    mov [className + 8], eax
    mov eax, 0
    mov [className + 12], eax
    mov eax, 0
    mov [className + 16], eax
    mov eax, 0
    mov [className + 20], eax
    mov eax, 0
    mov [className + 24], eax
    mov eax, 0
    mov [className + 28], eax
    mov eax, 0
    mov [className + 32], eax
    mov eax, 0
    mov [className + 36], eax
    mov eax, 0
    mov [className + 40], eax
    mov eax, 0
    mov [className + 44], eax
    mov eax, 0
    mov [className + 48], eax
    mov eax, 0
    mov [className + 52], eax
    mov eax, 0
    mov [className + 56], eax
    mov eax, 0
    mov [className + 60], eax
    mov eax, 0
    mov [className + 64], eax
    mov eax, 0
    mov [className + 68], eax
    mov eax, 0
    mov [className + 72], eax
    mov eax, 0
    mov [className + 76], eax
    mov eax, 0
    mov [className + 80], eax
    mov eax, 0
    mov [className + 84], eax
    mov eax, 0
    mov [className + 88], eax
    mov eax, 0
    mov [className + 92], eax
    mov eax, 0
    mov [className + 96], eax
    mov eax, 0
    mov [className + 100], eax
    mov eax, 0
    mov [className + 104], eax
    mov eax, 0
    mov [className + 108], eax
    mov eax, 0
    mov [className + 112], eax
    mov eax, 0
    mov [className + 116], eax
    mov eax, 0
    mov [className + 120], eax
    mov eax, 0
    mov [className + 124], eax
    mov eax, 0
    mov [className + 128], eax
    mov eax, 0
    mov [className + 132], eax
    mov eax, 0
    mov [className + 136], eax
    mov eax, 0
    mov [className + 140], eax
    mov eax, 0
    mov [className + 144], eax
    mov eax, 0
    mov [className + 148], eax
    mov eax, 0
    mov [className + 152], eax
    mov eax, 0
    mov [className + 156], eax
    mov eax, 0
    mov [className + 160], eax
    mov eax, 0