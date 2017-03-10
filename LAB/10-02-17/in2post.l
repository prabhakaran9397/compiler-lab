%{

#include <stdio.h>
#include <string.h>
#define SIZE 100

char stack[SIZE];
int stack_top = -1;
int precedence(char x)
{
        if(x == '+' || x == '-') {
                return 1;
        } else if(x == '*' || x == '/') {
                return 2;
        }
}

int isemp(void)
{
        return stack_top == -1;
}

int push(char x)
{
        if(stack_top < SIZE) {
                stack[++stack_top] = x;
                return 1;
        }
        return 0;
}

char pop(void)
{
        if(!isemp()) {
                return stack[stack_top--];
        }
        return 0;
}
		
%}

word [\-+]?[0-9a-zA-Z][0-9a-zA-Z_]*
operator [+\-*/]

%option noyywrap

%%

{word} {
	printf("%s ", yytext);
}

{operator} {
	if(isemp()) {
		push(yytext[0]);
	} else {
		if(precedence(yytext[0]) > precedence(stack[stack_top])) {
			push(yytext[0]);
		} else {
			printf("%c ", pop());
			push(yytext[0]);
		}
	}
}

\n {
	while(!isemp()) {
                printf("%c ", pop());
        }
	printf("\n");
}

%%

int main(int argc, char *argv[])
{
	yylex();
	return 0;
}
