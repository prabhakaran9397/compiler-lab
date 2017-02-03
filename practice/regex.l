
%%

\n {}

"[a-z]" { printf("_"); } 

%%

int main(int argc, char *argv[])
{
	yylex();
	return 0;
}
