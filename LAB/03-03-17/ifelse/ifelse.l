%{
#include "ifelse.yacc.h"
%}

WS	[ \t\n]
UOPT	"++"|"--"
BOPT	"+"|"-"|"/"|"*"|"%"
LOPT	"&"|"|"|"^"
ID	[a-z]+
NUM	[0-9]+

%%
if	return IF; 
else	return ELSE;
{BOPT}	return BOPT;
{UOPT}	return UOPT; 
{LOPT}	return LOPT;
{ID}	return ID;
{NUM}	return NUM;
{WS}	;
.	return *yytext;
%%
