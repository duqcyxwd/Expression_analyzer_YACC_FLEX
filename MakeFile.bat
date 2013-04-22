rm -f *.exe

bison -d gram.y
flex scan.l
gcc -o a.exe main.c lex.yy.c gram.tab.c
rm -f *.o lex.yy.c *.h *.tab.c

a.exe