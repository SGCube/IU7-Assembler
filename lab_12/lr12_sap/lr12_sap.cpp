#include "pch.h"
#include <iostream>
#include <cstring>

extern "C" void LATCPY(char *s1, char *s2, int len);

int main()
{
	char str1[] = "AB3DEF";
	char str2[] = "000000";
	LATCPY(str1, str2, strlen(str1));
	std::cout << str2 << std::endl;
	getchar();
	return 0;
}
