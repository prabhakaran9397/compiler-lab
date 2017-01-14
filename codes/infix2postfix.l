%{
	#include <stdio.h>
	#define STACK_SIZE	100
	#define SUC		1
	#define ERR		-1

	int Stack[STACK_SIZE];
	int Stack_T	= -1;

	int isEmpty(void)
	{
		return Stack_T == -1;
	}

	int push(int val)
	{
		if(Stack_T < STACK_SIZE-1) {
			Stack[++Stack_T] = val;
			return SUC;
		}
		return ERR;
	}

	int pop(void)
	{
		if(!isEmpty()) {
			return Stack[Stack_T--];
		}
		return ERR;
	}

	int PRECE(int i)
	{
		if(i == '+' || i == '-') {
			return 1;
		} else if(i == '*' || i == '/') {
			return 2;
		}
	}
%}

number [0-9]+
variable [a-zA-Z_][0-9a-zA-Z_]*

operand {number}|{variable}
operator [+\-*/]

%option noyywrap

%%

{operand}	{ printf("(%s)", yytext); }

{operator}	{
			if(isEmpty()) {
				push(yytext[0]);
			} else {
				if(PRECE(yytext[0]) > PRECE(Stack[Stack_T])) {
					push(yytext[0]);
				} else {
					printf("%c", pop());
					push(yytext[0]);
				}
			}
		}

\n		{
			while(!isEmpty()) {
				printf("%c", pop());
			}
		}

%%

int main(int argc, char *argv[])
{
	yylex();
	return 0;
}
