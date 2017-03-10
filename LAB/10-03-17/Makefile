%:	%.l.c %.y.c
	gcc $^ -o $@.out -ll
	rm *.y.h

%.l.c:	%.l
	lex -o $@ $^

%.y.c:	%.y
	yacc -d -o $@ $^

clean:
	rm -rf *.out
