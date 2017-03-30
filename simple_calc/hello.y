%{
#include <stdio.h>
%}

%start s
%union { char* str; }
%type<str> s
%token<str> NUM
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
s	: s '+' s 	{ $$=malloc(100); sprintf($$, "(%s+%s)", $1, $3); printf("%s\n", $$);} 
	| s '*' s	{ $$=malloc(100); sprintf($$, "(%s*%s)", $1, $3); printf("%s\n", $$);} 
	| NUM	 	{ $$ = $1; }
	;
%%

int yyerror(char *s)
{
	printf("%s\n", s);
}

int main()
{
	yyparse();
	return 0;
}
