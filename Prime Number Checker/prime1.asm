.model small
.stack
.data
	msg1 db "Enter number $"
	msg2 db 10,13, "The number is prime $"
	msg3 db 10,13, "The number is not prime $"
.code

	mov ax,@data
	mov ds,ax

	lea dx,msg
	mov ah,09h
	int 21h

	mov ah,01h
	int 21h
	sub al,48
	mov ah,00h
	mov bx,ax
	mov cl,02h
	cmp al,cl
	je print1

repeat1:	div cl
					cmp ah,00h
					je print
					inc cl
					mov ax,bx
					cmp al,cl
					ja repeat1

print1:	lea dx,msg2
				mov ah,09h
				int 21h
				jmp error

print:	lea dx,msg3
				mov ah,09h
				int 21h

error:	mov ah,04ch
				int 21h
				end
