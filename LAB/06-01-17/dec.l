%{
	#include <stdio.h>
	#include <string.h>
	#define SIZE 1000
	#define WLEN 50

	char ints[SIZE][WLEN];
	char chars[SIZE][WLEN];
	char floats[SIZE][WLEN];
	char rests[SIZE];
	int intc=0;
	int charc=0;
	int floatc=0;
	int i;
	int k;
%}
word [a-zA-Z_][a-zA-Z0-9_]*
int int[ ]{word}
float float[ ]{word}
char char[ ]{word}
rest .
nl \n

%%

{int} {
	for(i=4, k=0; i<yyleng; ++i) {
		ints[intc][k++] = yytext[i];
	}
	ints[intc++][k++] = 0;		
}

{float} {
        for(i=6, k=0; i<yyleng; ++i) {
                floats[floatc][k++] = yytext[i];
        }
	floats[floatc++][k++] = 0;
}

{char} {
        for(i=5, k=0; i<yyleng; ++i, ++k) {
                chars[charc][k] = yytext[i];
        }
        chars[charc++][k++] = 0;
}

{rest} {
	strcat(rests, yytext);
}

{nl} {

}

%%

void print(void)
{
	fprintf(yyout, "int ");
	for(i=0; i<intc; ++i) {
		fprintf(yyout, "%s", ints[i]);
		if(i<intc-1) {
			fprintf(yyout, ", ");
		}
	}
	fprintf(yyout, ";\n");
        fprintf(yyout, "float ");
        for(i=0; i<floatc; ++i) {
                fprintf(yyout, "%s", floats[i]);
                if(i<floatc-1) {
                        fprintf(yyout, ", ");
                }
        }
        fprintf(yyout, ";\n");
        fprintf(yyout, "char ");
        for(i=0; i<charc; ++i) {
                fprintf(yyout, "%s", chars[i]);
                if(i<charc-1) {
                        fprintf(yyout, ", ");
                }
        }
        fprintf(yyout, ";\n");
}

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	yyout = fopen(argv[2], "w");
	yylex();
	print();
	fclose(yyin);
	fclose(yyout);
	return 0;
}
