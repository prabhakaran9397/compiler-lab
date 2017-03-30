%:	%.l.c %.y.c
	gcc -o $@ $^ -ll

%.l.c:	%.l
	lex -o $@ $^

%.y.c:	%.y
	yacc -do $@ $^
