%{
#include <bits/stdc++.h>
using namespace std;
stack<int> box;

int eval(int a, int b, char op)
{
	if(op == '+') return a+b;
	if(op == '-') return a-b;
	if(op == '/') return a/b;
	if(op == '*') return a*b;
}

%}

word [\-+]?[0-9a-zA-Z][0-9a-zA-Z_]*
operator [+\-*/]

%option noyywrap

%%
{word}		{ box.push(atoi(yytext)); }
{operator}	{
		  int op1 = box.top(); box.pop();
		  int op2 = box.top(); box.pop();
		  box.push(eval(op2, op1, yytext[0])); 
		}
.		{ /* Do nothing */ }
\n		{ cout << box.top() << endl; box.pop(); }
%%

int main(int argc, char *argv[])
{
	yylex();
	return 0;
}
