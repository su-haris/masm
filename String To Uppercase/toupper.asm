.model small
PRINT MACRO MSG
LEA DX,MSG
MOV AH,09H
INT 21H
ENDM
.stack
.data
	s1 db 10 dup(?)
	s2 db 10 dup(?)
	msg1  db  "Enter string $"
	msg2  db 10,13, "Converted string $"

.code

	mov ax,@data
	mov ds,ax

	PRINT msg1
	lea SI,s1
	lea DI,s2
	mov cx,00

read:
	mov ah,01h
	int 21h
	cmp al,0dh
	je prt
	cmp al,61h
	jb store1
	cmp al,7Ah
	ja store1
	sub al,20h


store1:
	mov [DI],al
	inc DI
	inc SI
	inc cx
	jmp read
	mov s2[DI],"$"

prt:
	PRINT msg2
	lea DI,s2

loop1:
	mov dl,[DI]
	mov ah,02h
	int 21h
	inc DI
	loop loop1

	mov ah,04ch
	int 21h
	end
