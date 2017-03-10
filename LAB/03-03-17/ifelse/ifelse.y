%{
#include <bits/stdc++.h>
extern int yylex();
extern int yyerror(const char*);
%}

%token UOPT BOPT LOPT ID NUM IF ELSE

%%

stmt		: exprs			{ puts("[exprs]"); }
		| '{' stmt '}'		{ puts("[stmt]"); }
		| ifstmt		{ puts("[ifsmt]"); }
		;
ifstmt		: IF '(' expr ')' stmt	{ puts("[if]"); }
		| ifstmt ELSE stmt	{ puts("[ifelse]"); }
		;
exprs		: exprs expr ';'	{ puts("[exprs expr ;]"); }
		|
		;
expr		: unary			{ puts("[**[unary]**]"); }
		| binary 		{ puts("[**[binary]**]"); }
		| logical		{ puts("[**[logical]**]"); }
		| opand			{ puts("[opand]"); }
		;
unary		: UOPT expr		{ puts("[UOPT][expr]"); }
		| expr UOPT		{ puts("[expr][UOPT]"); }
		;
binary		: expr BOPT expr	{ puts("[expr][BOPT][expr]"); }
		;
logical		: expr LOPT expr	{ puts("[expr][LOPT][expr]"); }
		;
opand		: ID			{ puts("[ID]"); }
		| NUM			{ puts("[NUM]"); }
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
