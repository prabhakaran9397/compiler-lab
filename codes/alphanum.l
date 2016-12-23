%{
	int i;
%}
alphanum [a-zA-Z0-9]

%option noyywrap

%%

{alphanum} {
	for(i=0; yytext[i]; ++i)
		if(yytext[i]>'9')
			printf("%c", yytext[i]);
}

%%

int main(void)
{
	yylex();
	return 0;
}
