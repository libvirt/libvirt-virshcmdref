
prefix=/usr
datadir=$(prefix)/share
pkgdatadir=$(datadir)/publican
contentdir=$(pkgdatadir)/Common_Content

all: outputdata publicanhtml publicanpdf

outputdata:
	./generate_docbook45.sh
	./generate_html5.sh
	./generate_xhtml1_strict.sh
	./generate_xhtml1_trans.sh

publicanhtml:
	cd output/publican && publican build --langs=en-US --formats=html --common_content=$(contentdir)

publicanpdf:
	cd output/publican && publican build --langs=en-US --formats=pdf --common_content=$(contentdir)

publicanrpm:
	cd output/publican && publican package --lang=en-US --binary --desktop --common_content=$(contentdir)

clean:
	rm -rf output/publican/tmp
