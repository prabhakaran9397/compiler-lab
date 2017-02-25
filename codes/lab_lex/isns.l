/*
Print 'n's from a string of 'i's and 'n's
print 'Invalid String' if it has anything other than 'i' or 'n'
*/

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
