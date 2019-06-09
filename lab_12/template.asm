.386
.model FLAT,C
PUBLIC MK0
PUBLIC M1

PUSHR MACRO LIST
    IRP A,<LIST>
		IFIDN <A>,<F>
			PUSHF
		ELSE
			PUSH A
		ENDIF
	ENDM
ENDM

POPR MACRO LIST
    IRP A,<LIST>
		IFIDN <A>,<F>
			POPF
		ELSE
			POP A
		ENDIF
	ENDM
ENDM

XCHG

TempMacro MACRO type, tname, List1, List2

A = 0

tname&:
	PUSH EBP
	MOV EBP, ESP
	FOR param, <List1>
	.LALL
		param equ @catstr([EBP + %(8 + A*4)])
		.XALL
		A  = A + 1
	ENDM
	IFB <LIST2>
		PUSH EBX
		PUSH ESI
		PUSH EDI
	ELSE
		B = 1
		FOR param, <List2>
		PUSH param
		@catstr(XX,%B) textequ <param>
		B = B + 1
		ENDM
	ENDIF

	.LALL
	; Enter code
	.XALL

	IFIDN <type>,<INT>
		.LALL
		; MOV EAX, 
		.XALL
	ENDIF
	IFIDN <type>,<INT*>
		.LALL
		; MOV EAX, OFFSET X 
		.XALL
	ENDIF

	IFB <LIST2>
		POP EDI
		POP ESI
		POP EBX 
	ELSE
		B = B - 1
		WHILE B GT 0
			POP @catstr(XX,%B)
			B = B - 1
		ENDM
	ENDIF
		
	MOV ESP, EBP
	POP EBP
	RET
ENDM

.DATA

.CODE
MK0:
	RET
	TempMacro INT,M1,<X,Y>,<EDI,ESI>
END
