PUBLIC exit
EXTRN X: byte

SD2 SEGMENT para public 'DATA'
	Y db 'Y'
SD2 ENDS

SC2 SEGMENT para public 'CODE'
	assume CS:SC2, DS:SD2
exit:
	mov ax, SD2
	mov ds, ax
	
	mov ah, 2
	mov dl, Y
	int 21h
	
	mov ah, Y

	mov bx, SEG X
	mov es, bx
	mov al, es:X
	
	xchg ah, al
	
	mov X, al
	
	mov bx, SD2
	mov ds, bx
	mov Y, ah
	
	mov ah, 2
	mov dl, Y
	int 21h
	
	mov ah, 4ch
	int 21h
SC2 ENDS
END
