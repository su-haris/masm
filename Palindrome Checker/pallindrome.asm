.model small
.stack
.data
msg db "Enter the string:$"
msg1 db 10,13,"Not Palindrome$"
msg2 db 10,13,"Palindrome$"
s1 db 15 dup(?)
s1 db 15 dup(?)
.code

mov ax,@data
mov ds,ax

	mov cx,00
	lea dx,msg
	mov ah,09h
	int 21h
	lea si,s1

read:	mov ah,01h
			int 21h
			mov si,al
			cmp al,0dh
			JE loop1
			inc cx
			mov bx,cx
			JMP read

loop1:  dec si
				lea di,s2
				mov ax,[si]
				mov [di],ax
				inc di
				dec cx
				JNZ loop1

	lea si,s1
	lea di,s2

rep1:	mov ax,[si]
			cmp [di],ax
			JNZ loop2
			inc si
			inc di
			dec bx
			JNZ rep1
			lea dx,msg2
			mov ah,09h
			int 21h

loop2:	lea dx,msg1
				mov ah,09h
				int 21h

	mov ah,04ch
	int 21h
	end
