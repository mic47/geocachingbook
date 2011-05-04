
all: pdf

pdf: main.pdf

main.pdf: main.tex *tex caches/*
	./gen-cache-list
	pdflatex -shell-escape main.tex

clean:
	rm *aux *log main.pdf
