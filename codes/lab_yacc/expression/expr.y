%{
#include <stdio.h>
%}

%token BOP UOP ID NUM IF ELSE

%%
ifstmt	: IF '(' expr ')' body else	{ printf("[IF start]"); }
       	;
body	: '{' stmts '}'			{ printf("[{stmts}]"); }
     	| stmt				{ printf("[stmt]"); }
	;
else	: ELSE ' ' ifstmt		{ printf("[ELSE space ifstmt]"); }
     	| ELSE body			{ printf("[ELSE body]"); }
	|				{ printf("[(e)]"); }
	;
stmts	: stmt stmts			{ printf("[stmt][stmts]"); }
      	|				{ printf("[]"); }
	;
stmt	: expr ';'			{ printf("[stmt]"); }
     	| ifstmt			{ printf("[ifstmt]"); }
	| ';'				{ printf("[;]"); }
	;
expr	: expr BOP term			{ printf("[eBt]"); }
     	| term				{ printf("[t]"); }
	;
term	: '(' expr ')'			{ printf("[(e)]"); }
     	| id				{ printf("[id]"); }
	| NUM				{ printf("[NUM]"); }
	;
id	: UOP ID			{ printf("[UID]"); }
   	| ID UOP			{ printf("[IDU]"); }
	| ID				{ printf("[ID]"); }
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
