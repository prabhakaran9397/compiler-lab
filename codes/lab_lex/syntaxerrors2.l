%{ 
	int offset = 0; 
%}

%option yylineno
%option noyywrap

%s	DECS DECM DECE
%s	FUNC FDES FDEE
%s	ERROR

WS	[ \t]+
DT	(int|float|char){WS}
ID	[a-zA-Z_][0-9a-zA-Z_]*
AR	("["[0-9]+"]")+

%%
<INITIAL>{DT}	{ BEGIN DECS;	offset+=yyleng;	}
<DECS>{ID}	{ BEGIN DECM;	offset+=yyleng;	}
<DECS>.		{ BEGIN ERROR;			}
<DECM>{AR}	{ BEGIN DECE;	offset+=yyleng;	}
<DECM>\(	{ BEGIN FUNC;	offset+=yyleng;	}
<DECM>;		{ BEGIN 0;	offset+=yyleng;	}
<DECM>.		{ BEGIN ERROR;			}
<DECE>{WS}	{		offset+=yyleng;	}
<DECE>,		{ BEGIN DECS;	offset+=yyleng;	}
<DECE>;		{ BEGIN 0;	offset+=yyleng;	}
<DECE>.		{ BEGIN ERROR;			}
<FUNC>{WS}	{		offset+=yyleng;	}
<FUNC>{DT}	{ BEGIN FDES;	offset+=yyleng;	}
<FUNC>.		{ BEGIN ERROR;			}
<FDES>{ID}{AR}?	{ BEGIN FDEE;	offset+=yyleng;	}
<FDES>.		{ BEGIN ERROR;			}
<FDEE>{WS}	{		offset+=yyleng;	}
<FDEE>,		{ BEGIN FUNC;	offset+=yyleng;	}
<FDEE>\)	{ BEGIN 0;	offset+=yyleng;	}
<FDEE>.		{ BEGIN ERROR;			}
<ERROR>\n	{ BEGIN 0;	printf("Error in line %d at %d\n", yylineno-1, offset); offset=0; }
\n		{ BEGIN 0;	offset=0;	}
.		;
%%

int main(int argc, char *argv[])
{
	yyin = argc==2 ? fopen(argv[1], "r") : stdin;
	return yylex();
}
