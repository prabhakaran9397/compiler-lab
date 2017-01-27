%{
	#include <iostream>
	#include <stack>
	#include <string>
	#include <algorithm>

	using namespace std;
	
	stack<string> Operand;
%}

number [0-9]+
variable [a-zA-Z_][0-9a-zA-Z_]*

operand {number}|{variable}
operator [+\-*/]

%option noyywrap

%%

{operand}	{ Operand.push(yytext); }

{operator}	{
			string SubExpr;

			SubExpr += Operand.top();
			Operand.pop();

			SubExpr += yytext;

			SubExpr += Operand.top();
                        Operand.pop();

			Operand.push(SubExpr);
		}

\n		{
			if(!Operand.empty()) {
				string Expr = Operand.top();
				Operand.pop();

				reverse(Expr.begin(), Expr.end());
				cout << Expr;
			}
		}

.		{ } /* Whitespaces */  

%%

int main(int argc, char *argv[])
{
	yylex();
	return 0;
}
