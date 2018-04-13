.model small
.stack
.data
msg db "Enter the string:$"
msg1 db 10,13,"Reverse is:$"

.code

	mov ax,@data
	mov ds,ax

	lea dx,msg
	mov ah,09h
	mov cx,00
	int 21h

read:		mov ah,01h
				int 21h

	cmp al,0dh
	JE loop1
	push ax
	inc cx
	jmp read

loop1:	lea dx,msg1
				mov ah,09h
				int 21h

rep1:		pop dx
				mov ah,02h
				int 21h

	dec cx
	JNZ rep1

error:	mov ah,04ch
				int 21h
				end
