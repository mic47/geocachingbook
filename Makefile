#CITY=Calgary
#CITY=Edmonton
#CITY=Jasper
#CITY=NiagaraFalls
CITY=Toronto
#CITY=Waterloo #DONE

downloadlist=tempfiles/$(CITY).downloadlist
downloadedlist=tempfiles/$(CITY).downloadedlist
linksconvertscript=tempfiles/$(CITY).c.sh

all:

directories: 
	mkdir -p Geocaches/$(CITY) Gpx/$(CITY) Html/$(CITY) Web/$(CITY) Tex/$(CITY) tempfiles Books

cachelist: directories
	scripts/generate-file-list $(downloadlist) $(CITY)

download: directories
	scripts/download-web-pages $(downloadlist) $(CITY)
	mv Web/$(CITY)/www.geocaching.com/seek/cache_details*html Html/$(CITY)

parse: directories
	rm -rf Geocaches/$(CITY)/*.xml
	scripts/parse-web-pages Html/$(CITY) Geocaches/$(CITY)
	scripts/convert-locations Geocaches/$(CITY)

gpx:  directories
	rm -f Gpx/$(CITY)/*
	scripts/generate-gpx-files Geocaches/$(CITY) Gpx/$(CITY)

poi:  directories
	rm -rf Poi/$(CITY)/*
	scripts/generate-poi-files Geocaches/$(CITY) Gpx/$(CITY) Poi/$(CITY) Bitmaps $(CITY)

html: directories
	scripts/generate-html-files Geocaches/$(CITY) Web/$(CITY)/www.geocaching.com/seek
	scripts/generate-links-convert Html/$(CITY)/ 2> /dev/null > $(linksconvertscript)
	scripts/convert-links Web/$(CITY)/www.geocaching.com/seek $(linksconvertscript)
	#copy header

htmlheader: directories
	scripts/generate-html-book Web/$(CITY)/www.geocaching.com/seek $(CITY)

outsidelinks: directories
	scripts/extract-links Web/$(CITY)/www.geocaching.com/seek

closure: directories
	echo > $(downloadedlist).old ; \
	cat $(downloadlist) > $(downloadedlist) ; \
	while [ "`diff -q $(downloadedlist) $(downloadedlist).old`" != "" ] ; do  \
		make CITY=$(CITY) download ; \
		make CITY=$(CITY) parse ; \
		make CITY=$(CITY) html ; \
		make CITY=$(CITY) outsidelinks | grep 'http://www.geocaching.com/seek/cache_details.aspx' | sort -u > $(downloadlist) ; \
		cp $(downloadedlist) $(downloadedlist).old ;\
		cat $(downloadedlist) $(downloadlist) | sort -u > tempfiles/$(CITY).templist ;\
		cp tempfiles/$(CITY).templist $(downloadedlist); \
	done

automatic: directories
	make CITY=$(CITY) cachelist
	make CITY=$(CITY) closure
	make CITY=$(CITY) htmlheader
	make CITY=$(CITY) gpx
	make CITY=$(CITY) poi
	make CITY=$(CITY) mobi

mobi: directories
	ebook-convert Web/$(CITY)/www.geocaching.com/seek/index.html Books/$(CITY).mobi --output-profile kindle

#tex:
#	rm -f Tex/caches/*
#	scripts/generate-tex-files Geocaches Tex/caches

#Tex/main.pdf: Web/*html Makefile
#	cd Tex;	make

#clean: 
#	cd Tex; make clean

