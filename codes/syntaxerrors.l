%{
	/*
		Lexical and Syntax errors in declarations
	*/

	int error = 0;
%}

WS	[ \t]+
DT	(int|float|char){WS}?\*?
WD	[a-zA-Z_][0-9a-zA-Z_]*
ID	{WD}("["[0-9]*"]")*
NU	-?[0-9]*.[0-9]+
AS	{ID}({WS}?={WS}?{ID}|{NU})?
DL	{DT}{WS}{AS}{WS}?({WS}?,{WS}?{AS})*;
FU	{DT}{WS}{WD}{WS}?"("({WS}?{DT}{WS}{AS}{WS}?({WS}?,{WS}?{DT}{WS}{AS})*)?")"

%option yylineno
%option noyywrap

%%

^{DT}		{ error = 1; }
{DL}|{FU}	{ error = 0; }
\n		{ if(error){printf("Error at line %d\n", yylineno-1);} }
.		{ /*Ignore*/ }
%%

int main(int argc, char *argv[])
{
	yyin = argc==2 ? fopen(argv[1], "r") : stdin;
	return yylex();
}
