PUBLIC M2

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG

M2 PROC
	MOV DL, '2'
	MOV AH, 2
	INT 21h
	RET
M2 ENDP

CSEG ENDS
	END