// lr9_sorokinap.cpp: ���������� ����� ����� ��� ����������� ����������.
//

#include "stdafx.h"

extern "C" int p2(int N, int* g);

int N = 6, NF = 7;

int _tmain(int argc, _TCHAR* argv[])
{
	int i = p2(N, &NF);
	printf("%d\n", NF);
	getchar();
	return 0;
}
