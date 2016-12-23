%{
	int i;
%}
isns [i|n]+
else [a-zA-Z]*

%option noyywrap

%%

{isns} {
	for(i=0; yytext[i]; ++i)
		if(yytext[i]!='i')
			printf("%c", yytext[i]);
}
{else} {
	printf("Invalid String");
}

%%

int main(void)
{
	yylex();
	return 0;
}
