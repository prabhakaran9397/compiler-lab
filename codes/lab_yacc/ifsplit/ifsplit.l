%{
#include "ifsplit.y.h"
%}

%%
"&&"	return BAND;
"||"	return BOR;
if	return IF;
else	return ELSE;
stmt	return STMT;
[a-z]+	{ yylval.str=strdup(yytext); return ID; }
[ \t\n]	;
.	return *yytext;
%%
