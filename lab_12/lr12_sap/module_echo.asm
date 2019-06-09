.XALL
.386
.model FLAT, C
PUBLIC M0
INCLUDE TLib_echo.txt

.data
.code
M0:
	RET
	TempMacro VOID,LATCPY,<S1,S2,L>
END