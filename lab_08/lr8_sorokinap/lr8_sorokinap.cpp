// lr8_sorokinap.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"

unsigned char m[8][8] = { {'1', '1', '1', '1', '1'},
							{'2', '2', '2', '2', '2'},
							{'3', '3', '3', '3', '3'},
							{'4', '4', '4', '4', '4'},
							{'5', '5', '5', '5', '5'} };

int _tmain(int argc, _TCHAR* argv[])
{
	_asm
	{
				MOV EBX, 0
				MOV EDX, 0
		TRANS:	MOV ESI, 8
				MOV EDI, 1
				MOV ECX, 4
				SUB ECX, EDX
		TLOOP:	XCHG AL, BYTE PTR m[EBX + EDI]
				XCHG AL, BYTE PTR m[EBX + ESI]
				XCHG AL, BYTE PTR m[EBX + EDI]
				INC EDI
				ADD ESI, 8
				LOOP TLOOP
				INC EDX
				ADD EBX, 9
				CMP EDX, 4
				JNZ TRANS
	}

	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 5; j++)
			printf("%c ", m[i][j]);
		printf("\n");
	}
	printf("\n");

	for (int i = 0; i < 5; i++)
		for (int j = i + 1; j < 5; j++)
		{
			char tmp = m[i][j];
			m[i][j] = m[j][i];
			m[j][i] = tmp;
		}

	for (int i = 0; i < 5; i++)
	{
		for (int j = 0; j < 5; j++)
			printf("%c ", m[i][j]);
		printf("\n");
	}
	printf("\n");
	getchar();

	return 0;
}

