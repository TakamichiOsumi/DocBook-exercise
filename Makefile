
all: main.pdf main.html

main.fo: pdf_style.xsl main.sgml
	xsltproc --nonet -output $@ $^

main.xml: main.sgml
	xmllint --output $@ --noent --valid $^

main.html: main.xml html_style.xsl
	xsltproc --nonet -output $@ html_style.xsl main.xml

main.pdf: main.fo
	fop -c font.xml -fo $^ -pdf $@

.PHONY: clean
clean:
	@rm -rf *.fo *.pdf *.html main.xml
