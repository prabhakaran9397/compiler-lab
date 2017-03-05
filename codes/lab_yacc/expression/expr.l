%{
#include "expr.y.h"
%}

BOP	[-+*/&^|]|([<>=!]=?)
UOP	"++"|"--"

%%
if		return IF;
else		return ELSE;
{BOP}		return BOP;
{UOP}		return UOP;
[a-zA-Z]+	return ID;
[0-9]+		return NUM;
[ \t\n]		;		//Ignored chars
.		return *yytext;
%%
