%.o:	%.c
	gcc -o $@ $^ -ll

%.c:	%.l
	lex -o $@ $^

clean:
	rm *.o
