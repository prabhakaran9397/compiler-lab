%{
	#include <string.h>
	int keywords=0;
	int relops=0;
	int upcases=0;
	int lowcases=0;
	int splchars=0;
	int norchars=0;
	int norwords=0;
	int norlines=0;
%}
keyword if|then|else|for|while|int|float|real
relop <=?|>=?|=|<>
splchar [!@#\$%\^&*();]
norword [a-zA-Z_][a-zA-Z_0-9]*
norline \n

%option noyywrap

%%

{keyword} { 
	++keywords;
	++norwords;
	norchars+=strlen(yytext);
	for(; *yytext; ++yytext) {
		if(*(yytext)>='a' && *(yytext)<='z') {
			++lowcases;
		} else if(*(yytext)>='A' && *(yytext)<='Z') {
			++upcases;
		} 
	}
}
{relop} { 
	++relops;
	norchars+=strlen(yytext);
}
{splchar} { 
	++splchars; 
	++norchars;
}
{norword} { 
	++norwords;
	norchars+=strlen(yytext); 
        for(; *yytext; ++yytext) {
                if(*(yytext)>='a' && *(yytext)<='z') {
                        ++lowcases;
                } else if(*(yytext)>='A' && *(yytext)<='Z') {
                        ++upcases;
                }
        }
}
{norline} { 
	++norlines;
	++norchars;
}

%%

int main(void)
{
	yylex();
	printf("No. of Keywords: %d\n", keywords);
	printf("No. of Relational Operators: %d\n", relops);
	printf("No. of Uppercases: %d\n", upcases);
 	printf("No. of Lowercases: %d\n", lowcases);
 	printf("No. of Special Characters: %d\n", splchars);
	printf("No. of Characters: %d\n", norchars);
	printf("No. of Words: %d\n", norwords);
	printf("No. of Lines: %d\n", norlines);
	return 0;
}
