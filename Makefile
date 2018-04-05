# https://www.zotero.org/styles

HTMLS:=$(patsubst %.csl,%.html,$(wildcard *.csl))

all: $(HTMLS)

%.html: %.csl citations.md
	pandoc -s --bibliography biblio.bib --filter pandoc-citeproc citations.md --csl $< -o $@

clean:
	rm -rf *.html