CITY=Calgary
#CITY=Edmonton
#CITY=Jasper
#CITY=NiagaraFalls
#CITY=Toronto
#CITY=Waterloo

all:

cachelist:
	scripts/generate-file-list downloadlist $(CITY)

download:
	scripts/download-web-pages downloadlist $(CITY)
	mv Web/$(CITY)/www.geocaching.com/seek/cache_details*html Html/$(CITY)

parse:
	rm -rf Geocaches/$(CITY)/*.xml
	scripts/parse-web-pages Html/$(CITY)/ Geocaches/$(CITY)/
	scripts/convert-locations Geocaches/$(CITY)

gpx: 
	rm -f Gpx/$(CITY)/*
	scripts/generate-gpx-files Geocaches/$(CITY) Gpx/$(CITY)

html:
	scripts/generate-html-files Geocaches/$(CITY) Web/$(CITY)/www.geocaching.com/seek
	scripts/generate-links-convert Html/$(CITY)/ 2> /dev/null > tmp/c.sh
	scripts/convert-links Web/$(CITY)/www.geocaching.com/seek tmp/c.sh
	#copy header

htmlheader:
	scripts/generate-html-book Web/$(CITY)/www.geocaching.com/seek $(CITY)

outsidelinks:
	scripts/extract-links Web/$(CITY)/www.geocaching.com/seek


mobi:
	ebook-convert Web/$(CITY)/www.geocaching.com/seek/index.html $(CITY).mobi --output-profile kindle

#tex:
#	rm -f Tex/caches/*
#	scripts/generate-tex-files Geocaches Tex/caches

#Tex/main.pdf: Web/*html Makefile
#	cd Tex;	make

#clean: 
#	cd Tex; make clean

