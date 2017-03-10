%option yylineno
%option noyywrap

type		int|float|char
id		[a-zA-Z_][a-zA-Z_0-9]*
ws		[ \t]+
arr		"["[0-9]+"]"

%s		WS
%s		ID
%s		ARR_COMMA_SEMI
%s		ERROR

%{
int pos = 0;
%}

%%
<INITIAL>{type}		{ BEGIN WS; pos+=yyleng; }
<INITIAL>{ws}		{ pos+=yyleng; }
<WS>{ws}		{ BEGIN ID; pos+=yyleng; }
<ID>{id}		{ BEGIN ARR_COMMA_SEMI; pos+=yyleng; }
<ARR_COMMA_SEMI>{arr}	{ pos+=yyleng; }
<ARR_COMMA_SEMI>,	{ BEGIN ID; pos+=yyleng; }
<ARR_COMMA_SEMI>;	{ BEGIN INITIAL; pos+=yyleng; }
<ERROR>;		{ BEGIN INITIAL; pos+=yyleng; }
<ERROR>.		{ pos+=yyleng; }
\n			{ pos = 0; BEGIN INITIAL; }
.			{ printf("Error:%d:%d\n", yylineno, pos+1); BEGIN ERROR; yyless(0); }
%%

int main(void)
{
	return yylex();
}
