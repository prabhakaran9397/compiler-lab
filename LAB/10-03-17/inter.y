%{
#include <stdio.h>
int t = 0;
%}

%token ID NUM UOP OP1 OP2

%%
expr	: expr OP1 term	{ $$ = malloc(10); sprintf($$, "t%d", t++); printf("%s = %s %s %s\n", $$, $1, $2, $3); }
	| term		{ $$ = $1; }
	;
term	: term OP2 fact	{ $$ = malloc(10); sprintf($$, "t%d", t++); printf("%s = %s %s %s\n", $$, $1, $2, $3); }
	| fact		{ $$ = $1; }
	;
fact	: ID UOP	{ $$ = malloc(10); sprintf($$, "t%d", t++); printf("%s = %s %s 1\n", $$, $1, $2); }
	| UOP ID	{ $$ = malloc(10); sprintf($$, "t%d", t++); printf("%s = %s %s 1\n", $$, $2, $1); }
	| op		{ $$ = $1; }
	;
op	: ID		{ $$ = $1; }
	| NUM		{ $$ = $1; }
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
