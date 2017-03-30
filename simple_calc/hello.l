%{
#include "y.tab.h"
%}

%%
[0-9]+	{
	yylval.str = strdup(yytext);
	return NUM;
}
[ \t\n]	;
.	return yytext[0];
%%
