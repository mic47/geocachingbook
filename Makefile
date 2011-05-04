
all: Tex/main.pdf

Tex/main.pdf: Web/*html Makefile
	rm Geocaches/*.xml
	scripts/parse-web-pages Web Geocaches
	scripts/convert-locations
	scripts/generate-tex-files Geocaches Tex/caches
	cd Tex;	make

clean: 
	cd Tex; make clean

