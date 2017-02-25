%{
	#include <stdio.h>
	#include <string.h>

	#define WORD_LEN	50
	#define NO_WORDS	1000
	#define NO_DT		4
	#define TYPE_REST	3
	#define TYPE_INT	0
	#define TYPE_FLOAT	1
	#define TYPE_CHAR	2

	char Table[NO_DT][NO_WORDS][WORD_LEN];
	char Capture[NO_DT][WORD_LEN] = {"int", "float", "char"};

	int Count[NO_DT] = {0, 0, 0, 0};
	int TYPE	 = TYPE_REST;
%}

word [a-zA-Z_][a-zA-Z0-9_]*

%option noyywrap

%%

int	{ TYPE = TYPE_INT;	}

float	{ TYPE = TYPE_FLOAT;	}

char	{ TYPE = TYPE_CHAR;	}

{word}	{
		strcpy(Table[TYPE][Count[TYPE]++], yytext);
	}

.	{ } /* Ignored characters */

\n	{ TYPE = TYPE_REST;	}

%%

void print(void)
{
	int i;
	int j;

	for(i=0; i<NO_DT-1; ++i) {
		for(j=0; j<Count[i]; ++j) {
			if(j==0) {
				printf("%s ", Capture[i]);
			}
			printf("%s%c", Table[i][j], j<Count[i]-1 ? ',' : ';');
			if(j==Count[i]-1) {
				printf("\n");
			}
		}
	}
}

int main(void)
{
	yylex();
	print();
	return 0;
}
