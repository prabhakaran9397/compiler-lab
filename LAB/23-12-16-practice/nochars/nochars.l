%option noyywrap
%{
	#include <stdio.h>
	int i;
%}

%%
[i|n]+ {
	for(i=0; yytext[i]!='\0'; ++i)
		if(yytext[i]!='i')
			printf("%c", yytext[i]);
		
}
[a-zA-Z]+ {
	printf("Invalid string\n");
}
%%

int main(void)
{
	yylex();
	return 0;
}
