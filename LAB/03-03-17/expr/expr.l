%{
#include "expr.yacc.h"
%}

WS	[ \t]
UOPT	"++"|"--"
BOPT	"+"|"-"|"/"|"*"|"%"
LOPT	"&"|"|"|"^"
ID	[a-z]+
NUM	[0-9]+

%%
{BOPT}{WS}*		{ puts("(BOPT)"); return BOPT; }
{UOPT}{WS}*		{ puts("(UOPT)"); return UOPT; }
{LOPT}{WS}*		{ puts("(LOPT)"); return LOPT; }
{ID}{WS}*		{ puts("(ID)"); return ID; }
{NUM}{WS}*		{ puts("(NUM)"); return NUM; }
\n			{ return *yytext; }
.			{ return *yytext; }
%%
