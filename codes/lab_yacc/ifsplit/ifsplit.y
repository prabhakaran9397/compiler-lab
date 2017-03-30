%{
#include <stdio.h>
char ifpart[100][100] = {"stmt;", "stmt;"};
int top = 1;
%}

%union { char* str; }
%start stmts
%token STMT IF ELSE 
%token<str> ID
%type<str> exp
%left BOR
%left BAND

%%
stmts	: stmt stmts
      	| ifstmt stmts
	|
	;

stmt	: STMT ';'
    	| '{' stmts '}'
	;

ifstmt	: IF '(' exp ')' stmt
       	| ifstmt ELSE stmt
	;

exp	: exp BAND exp	{ sprintf(ifpart[++top], "if(%s) {\n\tif(%s) {\n\t\tstmt;\n\t\t}\n\t}\n", $1, $3); }
  	| exp BOR exp	{ printf("if(%s) {\n\t%s\n\t}\nelse if(%s) {\n\t%s\n}\n", $1, ifpart[top--], $3, ifpart[top--]); }
	| ID		{ $$ = $1; }
	;
%%

int yyerror(char* s)
{
	printf("[%s]", s);
}

int main(void)
{
	return yyparse();
}
