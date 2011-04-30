
all: pdf

pdf: main.pdf

main.pdf: main.tex *tex caches/*
	./gen_cache_list
	pdflatex -shell-escape main.tex

clean:
	rm *aux *dvi *log *pdf
