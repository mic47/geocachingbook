
all: Tex/main.pdf

Tex/main.pdf: Web/*html Makefile
	rm Geocaches/*.xml
	scripts/parse-web-pages Web Geocaches
	scripts/generate-tex-files Geocaches Tex/caches
	cd Tex;	make

