%{
#include <bits/stdc++.h>
extern int yylex();
extern int yyerror(const char*);
%}

%token UOPT BOPT LOPT ID NUM

%%
all:		expr all
		|
		;

expr:		'\n'			{ puts("[nl]"); }
		| unary			{ puts("[**[unary]**]"); }
		| binary 		{ puts("[**[binary]**]"); }
		| logical		{ puts("[**[logical]**]"); }
		| opand			{ puts("[opand]"); }
		;
unary:		  UOPT opand		{ puts("[UOPT][opand]"); }
		| opand UOPT		{ puts("[opand][UOPT]"); }
		;
binary:		  expr BOPT expr	{ puts("[expr][BOPT][expr]"); }
		;
logical:	  expr LOPT expr	{ puts("[expr][LOPT][expr]"); }
		;
opand:		  ID			{ puts("[ID]"); }
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
