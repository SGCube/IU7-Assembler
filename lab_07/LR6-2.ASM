PUBLIC M2

CSEG SEGMENT PARA PUBLIC 'CODE'
	ASSUME CS:CSEG

M2 PROC
	PUSH BX
	PUSH BP

	MOV BP, SP
	MOV DX, [BP + 6]
	MOV AH, 2
	MOV CX, 16

FIRST:
	SHL DX, 1
	JC PRINT1
	LOOP FIRST

	MOV CX, 1
	JMP PRINT0

MAINLP:
	SHL DX, 1
	JC PRINT1

PRINT0:
	PUSH DX
	MOV DL, '0'
	JMP PRINT
PRINT1:
	PUSH DX
	MOV DL, '1'
PRINT:
	INT 21h
	POP DX
	LOOP MAINLP

	POP BP
	POP BX
	RET 2
M2 ENDP

CSEG ENDS
	END