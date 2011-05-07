
all: pdf

pdf: main.pdf

main.pdf: main.tex *tex caches/*
	./gen-cache-list
	pdflatex  main.tex
	pdflatex  main.tex

clean:
	rm *aux *log main.pdf
