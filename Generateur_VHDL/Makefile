# compilation du projet Arbre

all : arbre

arbre : main.o struct.o iofile.o component.o construcA.o
	gcc main.o struct.o iofile.o component.o construcA.o -o arbre

main.o : main.c iofile.h struct.h
	gcc -Wall -c main.c

iofile.o : iofile.c iofile.h struct.h component.h construcA.h
	gcc -Wall -c iofile.c

struct.o : struct.c struct.h
	gcc -Wall -c struct.c

component.o : component.c component.h struct.h
	gcc -Wall -c component.c

construcA.o : construcA.c construcA.h struct.h
	gcc -Wall -c construcA.c

run :
	./arbre *.txt

pdf :
	pdflatex *.tex

clean :
	rm -f *.o *.tex *.csv *.vhd *.log *.aux *~ arbre
