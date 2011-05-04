
all: Tex/main.pdf

Tex/main.pdf: Web/*html Makefile
	rm -f Geocaches/*.xml
	rm -f gpx/*gpx
	scripts/parse-web-pages Web Geocaches
	scripts/convert-locations Geocaches
	scripts/generate-gpx-files Geocaches gpx
	scripts/generate-tex-files Geocaches Tex/caches
	cd Tex;	make

clean: 
	cd Tex; make clean

