                                          .model small

.data
    msg db 0ah,0dh,"Enter a number: $"
    res db 0ah,0dh,"Result: $"

.code
    mov ax, @data
    mov ds, ax

    call get_num     ; Call to get the number from user
    call display_num ; Call to display the number

    mov ah, 4ch
    int 21h

get_num proc
    mov dx, offset msg
    mov ah, 09h
    int 21h         ; Display "Enter a number:"

    mov ah, 01h
    int 21h         ; Read a character

    sub al, 30h     ; Convert ASCII to numeric value

    ret
get_num endp

display_num proc
    mov dl, al      ; Move the number to display into DL
    add dl, 30h     ; Convert the number to ASCII character

    mov ah, 02h
    int 21h         ; Display the result character

    ret
display_num endp
