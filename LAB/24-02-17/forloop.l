%option noyywrap

%{ 
	char string[100];
	char content[100];
	int size=0;
%}

ws	[ \t]+

%s	FOR
%s	ASSIGN
%s	COND
%s	INCDEC
%s	COPY
%s	COPYING

%%
<INITIAL>for	{ BEGIN FOR; }
<FOR>"("	{ BEGIN ASSIGN; }
<ASSIGN>{ws}	{} 
<ASSIGN>;	{ string[size]=0; if(*string) printf("%s;\n", string); size=0; puts("BEGIN: "); printf("if("); BEGIN COND; }
<ASSIGN>.	{ string[size++] = yytext[0]; }
<COND>{ws}	{}
<COND>;		{ string[size]=0; printf("%s", string); size=0; puts("){"); BEGIN INCDEC; }
<COND>.		{ string[size++] = yytext[0]; }
<INCDEC>{ws}	{}
<INCDEC>")"	{ string[size]=0; size=0; BEGIN COPY; }
<INCDEC>.	{ string[size++] = yytext[0]; }
<COPY>"{"	{ BEGIN COPYING; }
<COPYING>"}"	{ content[size]=0; size=0; puts(content); if(*string) printf("\n\t%s;", string); printf("\n\tgoto BEGIN;\n}"); BEGIN INITIAL; }
<COPYING>.	{ content[size++] = yytext[0];}
%%

int main(int argc, char *argv[])
{
	return yylex();
}
