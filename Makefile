
all: main.pdf

main.fo: style.xsl main.sgml
	xsltproc --nonet -output $@ $^

main.pdf: main.fo
	fop -fo $^ -pdf $@

.PHONY: clean
clean:
	@rm -rf *.fo *.pdf
