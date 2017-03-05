%{
#include <bits/stdc++.h>
extern int yylex();
extern int yyerror(const char*);
%}

%token DT WS ID

%%
stmt:	  decl
	| stmt WS decl
	;
decl:	  DT WS iden ';' { puts("Valid!"); }
	;
iden:	  ID
    	| iden ',' ID
    	| iden ',' WS ID
	;
%%

int main(int argc, char *argv[])
{
	yyparse();
	return 0;
}

int yyerror(const char *s)
{
	fprintf(stderr, "%s\n", s);
}
