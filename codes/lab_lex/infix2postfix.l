%{
	#include <cstdio>
	#include <stack>

	using namespace std;
	
	stack<char> Operator;

	int weight(int i)
        {
                if(i == '+' || i == '-') {
                        return 1; 
                }
		else if(i == '*' || i == '/') {
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

{operand}	{ printf("%s ", yytext); }

{operator}	{
			if(Operator.empty() || weight(yytext[0]) > weight(Operator.top())) {
				Operator.push(yytext[0]);
			}
			else {
				printf("%c ", Operator.top());
				Operator.pop();
				Operator.push(yytext[0]);
			}
		}

\n		{
			while(!Operator.empty()) {
				printf("%c ", Operator.top());
				Operator.pop();
			}
		}

%%

int main(int argc, char *argv[])
{
	yylex();
	return 0;
}
