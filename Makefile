%:	%.c
	gcc -o $@ $^ -ll

%.c:	%.l
	lex -o $@ $^
