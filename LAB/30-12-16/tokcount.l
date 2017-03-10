%{
	int identifiers=0;
	int numbers=0;
	int assignments=0;
	int whitespaces=0;
	int operators=0;
%}
identifier [a-zA-Z_]+
number [0-9]+
whitespace [ \t\n]
assignment :=
operator [+\-*/]

%option noyywrap

%%

{identifier} { ++identifiers; }
{number} { ++numbers; }
{whitespace} { ++whitespaces; }
{assignment} { ++assignments; }
{operator} { ++operators; }

%%

int main(void)
{
	yylex();
	printf("No. of Idetifiers: %d\n", identifiers);
	printf("No. of Numbers: %d\n", numbers);
	printf("No. of whitespaces: %d\n", whitespaces);
 	printf("No. of Assignments: %d\n", assignments);
 	printf("No. of Operators: %d\n", operators);
	return 0;
}
