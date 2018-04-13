.model small
.stack
.data

	s1 db 10 dup(?)
	msg1 db 10,13,"enter the string: $"
	msg2 db 10,13,"converted string: $"


.code

	mov ax,@data
	mov ds,ax

	lea dx,msg1
	mov ah,09
	int 21h
	mov cl,00
	lea si,s1
	
read:	mov ah,01
	int 21h
	cmp al,0dh
	je compare
	mov [si],al
	inc si
	inc cl
	jmp read

compare: 
	lea si,s1
	lea dx,msg2
	mov ah,09
	int 21h

loop1:	mov al,[si]
	cmp al,61h
	jb upper
	cmp al,7ah
	ja upper
	sub al,20h
	mov dl,al
	mov ah,02
	int 21h
	inc si
	dec cl
	jz exit
	jmp loop1
	

upper:	mov dl,al
	mov ah,02
	int 21h
	inc si
	dec cl
	jz exit
	jmp loop1		

exit:	mov ah,04ch
	int 21h
end