%{
#include "inter.y.h"
#define YYSTYPE char *
extern YYSTYPE yylval;
%}

WS	[ \t\n]
UOP	"++"|"--"
OP1	[-+]
OP2	[/*]
ID	[a-z]+
NUM	[0-9]+

%%
{UOP}	{ yytext[1]=0; yylval = strdup(yytext); return UOP; }
{OP1}	{ yylval = strdup(yytext); return OP1; }
{OP2}	{ yylval = strdup(yytext); return OP2; }
{ID}	{ yylval = strdup(yytext); return ID; }
{NUM}	{ yylval = strdup(yytext); return NUM; }
{WS}	;
.	return *yytext;
%%
