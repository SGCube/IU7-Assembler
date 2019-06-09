.386
.model FLAT, C
PUBLIC LATCPY

.CODE
LATCPY:

PUSH EBP
MOV EBP, ESP

S1 EQU [EBP + 8]
S2 EQU [EBP + 12]
L EQU [EBP + 16]

PUSH EBX
PUSH ESI
PUSH EDI

maincode:
mov ESI, S1
mov EDI, S2
mov ECX, L

mov EBX, EDI
mov EDX, ECX

cmp ESI, EDI
je finish
	
s1to0:
xor AL, AL
inc ECX
repne scasb
sub EDX, ECX
mov ECX, EDX

s2to0:
mov EDI, EBX
mov EBX, ESI
xchg EDI, ESI

inc ECX
repne scasb
sub EDX, ECX
mov ECX, EDX

ptrret:
xchg EDI, ESI
mov ESI, EBX
mov EBX, EDI
	
ptrcmp:
cld
cmp ESI, EDI
ja movelp

mov EAX, EDI
sub EAX, ESI
cmp EAX, ECX
ja movelp

mov EDX, ECX
dec EDX
add EDI, EDX
add ESI, EDX
std
	
movelp:
lodsb

cmp AL, 'A'
jb skip
cmp AL, 'Z'
jbe latin
cmp AL, 'z'
ja skip
cmp AL, 'a'
jb skip

latin:
stosb
jmp lp

skip:
inc EDI
lp:
loop movelp

finish:

POP EDI
POP ESI
POP EBX

MOV ESP, EBP
POP EBP
RET

END