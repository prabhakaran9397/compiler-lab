%{

#include <stdio.h>

enum {
	NOTHING=0,
	DATATYPE,
	VARIABLE,
	TERMINATOR
};

int seen = NOTHING;
int check = 0;
int line = 0;
int offset = 0;
int function = 0;

%}

datatype int|float|char
variable [a-zA-Z_][a-zA-Z0-9_]*
subscript (\[[0-9]*\])+
terminator ;
character .
eol \n

%%

{datatype} {
	offset += yyleng;
	check = 1;
	seen = DATATYPE;
}

{variable} {
		if(seen == DATATYPE || seen == VARIABLE) {
			offset += yyleng;
			seen = VARIABLE;
		} 
		else {
			seen = NOTHING;
		}
}

{terminator} {
		if(seen == VARIABLE) {
			offset += yyleng;
			seen = TERMINATOR;
		} 
		else {
			seen = NOTHING;
		}
}

{eol} {
	++line;
	if(check && seen != TERMINATOR) {
		printf("Error at %d in line:[%d]\n", offset, line);
		seen = NOTHING;
		check = 0;
	}
	offset = 0;
}

{character} { 
	++offset;
} 

%%

int main(int argc, char *argv[])
{
        yyin = fopen(argv[1], "r");
        yylex();
        fclose(yyin);
        return 0;
}

