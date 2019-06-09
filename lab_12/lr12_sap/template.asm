.386
.model FLAT,C
PUBLIC MK0
PUBLIC M1

INCLUDE TLib.txt
INCLUDE XchgLib.txt
.DATA
	AA DB 1
	BB DB 2

.CODE
MK0:
	RET
	TempMacro INT,M1,<X,Y>,<EDI,ESI>
	byte_xchg AA,BB
	word_xchg BX,CX
	dword_xchg EBX,ECX
END
