%{
#include "validate.yacc.h"
%}

%%
[ \t]+			{ return WS; }
int|float|char		{ return DT; }
[a-zA-Z_][a-zA-Z0-9_]*	{ return ID; }
.			{ return *yytext; }
%%
