digit [0-9]
letter [a-zA-Z]

%%
({digit})*	printf("id: %s\n", yytext);
\n		printf("new line\n");
%%

int main ()
{
	yylex();
	return 0;
}
