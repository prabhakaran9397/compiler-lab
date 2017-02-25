/*
	Skeleton for yacc file
*/

%{
#include <bits/stdc++.h>
extern int yylex();
extern int yyerror(const char*);
%}

%token

%%

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
