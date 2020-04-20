newExcutable: modify
	gcc test.c -o test | gcc newTest.c -o newTest
modify: executable
	./a.out <test.c >newTest.c
executable: lex.yy.c
	g++ lex.yy.c
lex.yy.c: test.l
	lex test.l
clean:
	rm -rf lex.yy.c a.out test newTest