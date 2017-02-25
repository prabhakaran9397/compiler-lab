%{
#include "declvalid.y.h"
%}

DT int|float|char
WS [ \t\n]*
ID [a-zA-Z_][a-zA-Z0-9_]*

%%

{DT}	{ return DT; }
{WS}	{ return WS; }
{ID}	{ return ID; }
.	{ return *yytext; }

%%
