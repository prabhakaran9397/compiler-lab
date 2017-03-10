%{

#include <bits/stdc++.h>
using namespace std;

stack<string> box;

%}

word [0-9a-zA-Z][0-9a-zA-Z_]*
operator [+\-*/]

%option noyywrap

%%

{word} {
	box.push(yytext);
}

{operator} {
	string op;
	op += box.top();
	box.pop();
	op += yytext;
	op += box.top();
	box.pop();
	box.push(op); 
}

. {
	// Do nothing
}

\n {
	string ans = box.top();
	box.pop();
	for(int i=ans.size()-1; i>=0; --i) {
		cout << ans[i];
	}
	cout << endl;
}

%%

int main(int argc, char *argv[])
{
	yylex();
	return 0;
}
