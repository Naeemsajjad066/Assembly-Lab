.model small

.data
num db ?
msg db 0ah,0dh,"Enter number$"
res db 0ah,0dh,"Result:$"
.code
mov ax,@data
mov ds,ax

mov dx,offset msg
mov ah,09h
int 21h

mov ah,01h
int 21h   
sub al,30h

mov num,al

mov dx,offset res
mov ah,09h
int 21h

mov dl,num
add dl, 30h ; convert number to ASCII character
mov ah,02h
int 21h

mov ah,4ch
int 21h
end
