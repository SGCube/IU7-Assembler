.386
.model FLAT,C
PUBLIC X_Y

.CODE
X_Y PROC
X	EQU DWORD PTR[EBP+16]
Y	EQU DWORD PTR[EBP+12]
L	EQU DWORD PTR[EBP+8]

	PUSH EBP
	MOV EBP,ESP
	PUSH ESI
	PUSH EDI

	MOV ECX,L
	SHR ECX,5
	MOV EDI,X
	MOV ESI,Y
	INC ECX
@M1:
	MOV EAX,[ESI]
	NOT EAX
	AND [EDI],EAX
	ADD EDI,4
	ADD ESI,4
	LOOP @M1

	POP EDI
	POP ESI
	POP EBP
	RET 12
X_Y ENDP
END
