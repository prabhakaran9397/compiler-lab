/*
Print the number of identifiers, keywords, etc.
*/

%{
	#include <string.h>
	int identifiers=0;	// variables
	int keywords=0;		// int, float, real, while, if, then, else
	int assignments=0;	// :=
	int operators=0;	// +, -, *, /
	int reloperators=0;	// <, >, =, <=, >=, <>
	int splchars=0;		// $, ^, (, ), ;, #, !
	int uppercases=0;	// a to z
	int lowercases=0;	// A to Z
	int totwords=0;		// all words
	int totchars=0;		// all characters
	int totlines=0;		// all lines - \n
	int whitespaces=0;	// whitespaces, tabs
%}

keyword int|float|real|while|if|then|else|print
identifier [a-zA-Z_][a-zA-Z0-9_]*
assignment :=
operator [+\-*/]
reloperator <=?|>=?|=|<>
splchar [\$\^();#!]
line \n
whitespace [ \t]
rest .

%option noyywrap

%%

{keyword} {
	++keywords;
	++totwords;
	totchars+=yyleng;
	for(; *yytext; ++yytext) {
		if('a'<=*yytext && *yytext<='z') {
			++lowercases;
		} else if('A'<=*yytext && *yytext<='Z') {
			++uppercases;
		}
	}
}
{identifier} {
	++identifiers;
	++totwords;
	totchars+=yyleng;
	for(; *yytext; ++yytext) {
		if('a'<=*yytext && *yytext<='z') {
			++lowercases;
		} else if('A'<=*yytext && *yytext<='Z') {
			++uppercases;
		}
	}
}
{assignment} {
	++assignments;
	totchars+=yyleng;
}
{operator} {
	++operators;
	totchars+=yyleng;
}
{reloperator} {
	++reloperators;
	totchars+=yyleng;
}
{splchar} {
	++splchars;
	totchars+=yyleng;
}
{whitespace} {
	++whitespaces;
	totchars+=yyleng;
}
{line} {
	++totlines;
	totchars+=yyleng;
}
{rest} {
	++totchars;
}

%%

int main(void)
{
	yylex();
	printf("Identifiers: %d\n", identifiers);
	printf("Keywords: %d\n", keywords);
	printf("Assignments: %d\n", assignments);
	printf("Operators: %d\n", operators);
	printf("Relational Operators: %d\n", reloperators);
	printf("Special Chars: %d\n", splchars);
	printf("Uppercases: %d\n", uppercases);
	printf("Lowercases: %d\n", lowercases);
	printf("Total Words: %d\n", totwords);
	printf("Total Chars: %d\n", totchars);
	printf("Total Lines: %d\n", totlines);
	printf("Whitespaces: %d\n", whitespaces);

	return 0;
}
