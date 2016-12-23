## Compiler Design Lab

Download this repository -> [compiler-lab](https://github.com/prabhakaran9397/compiler-lab/archive/master.zip)

### Installing lex & yacc
$`sudo apt-get update`

$`sudo apt-get install byacc flex`

### Using `Makefile`
$`vim ~/Makefile`

#### `Makefile` content
```
%.o:	%.c
	gcc -o $@ $^ -ll

%.c:	%.l
	lex -o $@ $^

clean:
	rm *.o
```
#### Aliasing `make command` 
$`echo 'alias mkl="make -f ~/Makefile"' >> ~/.*shrc`

$`source ~/.*shrc`

### Compiling and Executing Lex
###### I've used this repository codes as example
$`cd ~/compiler-lab/codes && ls`
```
count.l hello.c
```
###### Replace `.l` with `.o` and make the lex file
$`mkl count.o`
```
lex -o count.c count.l
gcc -o count.o count.c -ll
rm count.c
```
##### Execute it like this
$`./count.o`
```
hello
This is a test
:)
<press control+d>
Number of chars: 24
Number of lines: 3
```
###### To test a c program using lex
$`cat hello.c | ./count.o`
```
Number of chars: 77
Number of lines: 7
```
##### Cleaning the object files - if necessary
$`ls`
```
count.l  count.o  hello.c
```
$`mkl clean`
```
rm *.o
```
$`ls`
```
count.l hello.c
```