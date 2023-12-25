.model small

.data
    array db 5 dup(?)  
    msg db 0ah,0dh,"Enter 5 elements$"
    msg1 db 0ah,0dh,"Result: $"

.code
    mov ax, @data
    mov ds, ax  ; Load the data segment address into DS

    mov dx, offset msg
    mov ah, 09h
    int 21h 

    mov si, 0
    mov cx, 5

lopp:

    mov ah, 01h     ; Input character from the user
    int 21h
    sub al, 30h     ; Convert ASCII to numeric value

    mov [array + si], al  ; Store the entered value in the array
    inc si

    loop lopp       ; Continue looping until CX becomes zero     
    
    mov si, 0       ; Reset SI to point to the beginning of the array
    mov cx, 5       ; Set CX to 5, the number of elements in the array

display_result:
    mov dx, offset msg1  ; Display "Result: "
    mov ah, 09h
    int 21h 

    mov si, 0       ; Reset SI to point to the beginning of the array
    mov cx, 5       ; Set CX to 5, the number of elements in the array

display_array_elements:
    mov dl, [array + si] ; Load the array element to display
    add dl, '0'           ; Convert to ASCII character
    mov ah, 02h          ; DOS function for displaying character
    int 21h             ; Display the character

    inc si              ; Move to the next element
    loop display_array_elements ; Continue displaying until CX becomes zero

    mov ah, 4ch        ; Exit program
    int 21h 
end
