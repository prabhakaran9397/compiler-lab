## Compiler Design Lab

Download this repository -> [compiler-lab](https://github.com/prabhakaran9397/compiler-lab/archive/master.zip) (move it to home folder)

### Installing lex & yacc
$`sudo apt-get update`

$`sudo apt-get install byacc flex`

### To clone
$`cd ~ && git clone https://github.com/prabhakaran9397/compiler-lab/`

### Using `Makefile` 
###### Download the makefiles from my repo
$`cp ~/compiler-lab/mkl ~/.mkl; cp ~/compiler-lab/mky ~/.mky`

#### Aliasing `make command`

$`echo 'alias mkl="make -f ~/.mkl"' >> ~/.*shrc`

$`echo 'alias mky="make -f ~/.mky"' >> ~/.*shrc`

$`source ~/.*shrc`

### Compiling and Executing Lex
###### I've used this repository codes as example
$`cd ~/compiler-lab/codes && ls`
```
count.l hello.c
```
###### Type without `.l` to make the lex file
$`mkl count`
```
lex -o count.c count.l
g++ -o count count.c -ll
rm count.c
```
##### Execute it like this
$`./count`
```
hello
This is a test
:)
<press control+d>
Number of chars: 24
Number of lines: 3
```
###### To test a c program using lex
$`cat hello.c | ./count`
```
Number of chars: 77
Number of lines: 7
```
