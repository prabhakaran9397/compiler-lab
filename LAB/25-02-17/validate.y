%{
#include <bits/stdc++.h>
extern int yylex();
extern int yyerror(const char*);
%}

%token DT WS ID

%%

declaration:	  DT WS identifiers ';'	{ printf("Valid!\n");  }
		;

identifiers:	  ID
		| identifiers ',' ID 
		;

%%

int yyerror(const char* s)
{
	fprintf(stderr, "%s\n", s);
}

int main(void)
{
	yyparse();
}
