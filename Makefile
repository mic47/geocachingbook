all:

cachelist:
	scripts/generate-file-list downloadlist

download:
	scripts/download-web-pages downloadlist
	mv Web/www.geocaching.com/seek/cache_details*html Html

parse:
	rm -rf Geocaches/*.xml
	scripts/parse-web-pages Html Geocaches
	scripts/convert-locations Geocaches

gpx: 
	rm -f Gpx/*
	scripts/generate-gpx-files Geocaches Gpx

html:
	scripts/generate-html-files Geocaches Web/www.geocaching.com/seek
	scripts/generate-links-convert Html/ 2> /dev/null > tmp/c.sh
	scripts/convert-links Web/www.geocaching.com/seek tmp/c.sh
	#copy header

htmlheader:
	scripts/generate-html-book Web/www.geocaching.com/seek

outsidelinks:
	scripts/extract-links Web/www.geocaching.com/seek


mobi:
	ebook-convert Web/www.geocaching.com/seek/index.html book.mobi --output-profile kindle

tex:
	rm -f Tex/caches/*
	scripts/generate-tex-files Geocaches Tex/caches

Tex/main.pdf: Web/*html Makefile
	cd Tex;	make

clean: 
	cd Tex; make clean

