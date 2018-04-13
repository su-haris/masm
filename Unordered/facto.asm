.model small
.stack
.data
	msg1 db "Enter number $"
	msg2 db 10,13, "Factorial is $"
.code
	mov ax,@data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	sub al,48
	mov ch,al
	mov dl,ch
	dec dl
	mov ah,00

repeat:	dec ch
	mul ch
	dec dl
	jnz repeat
	aam
	mov bx,ax
	add bl,48
	add bh,48

	lea dx,msg2
	mov ah,09h
	int 21h
	mov dl,bh
	mov ah,02h
	int 21h
	mov dl,bl
	mov ah,02h
	int 21h
	

	mov ah,04ch
	int 21h
	end