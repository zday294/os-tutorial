section .data
    message db 72 101 108 108 111 32 119 111 114 108 100 33 13 10 0; "Hello world!"


section .code
    mov ah, 0x0e ; tty mode
    mov cx, 14 ; length of the message array
.begin:
    lea bx, [message] ; load the first address of message array
.hello:
    mov al, [bx]
    int 0x10
    inc bx
    cmp bx, cx
    jl  hello
    jmp begin ; jump to current address = infinite loop

    ; padding and magic number
    times 510 - ($-$$) db 0
    dw 0xaa55 
