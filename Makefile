
all: Tex/main.pdf

parse:
	rm -r Geocaches/*.xml
	scripts/parse-web-pages Web Geocaches
	scripts/convert-locations Geocaches

gpx: 
	scripts/generate-gpx-files Geocaches Gpx



Tex/main.pdf: Web/*html Makefile
	scripts/generate-tex-files Geocaches Tex/caches
	cd Tex;	make

clean: 
	cd Tex; make clean

