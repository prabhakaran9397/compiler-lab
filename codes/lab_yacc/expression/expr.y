%{
#include <stdio.h>
%}

%token BOP UOP ID NUM IF ELSE

%%
ifstmt	: IF '(' expr ')' body else
       	;
body	: '{' stmts '}'		
     	| stmt
	;
else	: ELSE ' ' ifstmt
     	| ELSE body
	|
	;
stmts	: stmt stmts	
      	|	
	;
stmt	: expr ';'
     	| ifstmt
	| ';'
	;
expr	: expr BOP term		
     	| term
	;
term	: '(' expr ')'	
     	| id	
	| NUM
	;
id	: UOP ID		
   	| ID UOP			
	| ID		
	;
%%

int main(void)
{
	return yyparse();
}

int yyerror(const char *s)
{
	fprintf(stderr, "%s\n", s);
}
