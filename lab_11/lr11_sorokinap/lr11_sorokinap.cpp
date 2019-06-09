#include "pch.h"
#include <stdio.h>

extern "C" int DlinaStroki(char *s);
extern "C" char *CopyStr(char *s1, char *s2, int L);
extern "C" int DelProbel(char *s);

int main()
{
	char s1[] = "123456789";
	char s2[] = "  abcdefg       ";

	int len1 = DlinaStroki(s1), len2 = DlinaStroki(s2);
	printf("%d\n%s[0]\n%d\n%s[0]\n\n", len1, s1, len2, s2);

	len2 = DelProbel(s2);
	printf("%d\n%s[0]\n\n", len2, s2);

	CopyStr(&s1[2], &s1[4], 4);
	printf("%s[0]\n", s1);

	getchar();
	return 0;
}