# Makefile for SUSTechThesis

PACKAGE = sustechthesis
THESIS  = sustechthesis-example
REPORT  = sustechthesis-example-report

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty $(PACKAGE).cls

LATEXMK = latexmk
SHELL  := /bin/bash
WORDCOUNTLOG  = wordcount.txt

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: all all-dev clean cleanall thesis viewthesis report viewreport dist dist-github doc viewdoc cls test wordcount FORCE_MAKE

thesis: $(THESIS).pdf
report: $(REPORT).pdf

all: thesis

all-dev: doc all

cls: $(CLSFILE)

$(CLSFILE): $(SOURCES)
	xetex $(PACKAGE).ins

doc: $(PACKAGE).pdf

dist-github: doc thesis test clean

dist: dist-github
	rm -rf dist/
	mkdir -p dist/
	zip -r dist/sustech-thesis-dev-build.zip . -x *.git* /*node_modules/* .editorconfig *dist/*

$(PACKAGE).pdf: cls FORCE_MAKE
	$(LATEXMK) $(PACKAGE).dtx

$(THESIS).pdf: cls FORCE_MAKE
	$(LATEXMK) $(THESIS)

$(REPORT).pdf: cls FORCE_MAKE
	$(LATEXMK) $(REPORT)

viewdoc: doc
	$(LATEXMK) -pv $(PACKAGE).dtx

viewthesis: thesis
	$(LATEXMK) -pv $(THESIS)

viewreport: report
	$(LATEXMK) -pv $(REPORT)

test: cls FORCE_MAKE
	bash test/test.sh

clean:
	$(LATEXMK) -c $(PACKAGE).dtx $(THESIS) $(REPORT)
	-@$(RM) -rf *.aux *.bbl *.blg
	-@$(RM) -rf _minted-*
	-@$(RM) -rf *~ *_markdown_* *.markdown.*

cleanall: clean
	-@$(RM) $(CLSFILE)
	-@$(RM) -rf public-test dist
	-@$(RM) $(PACKAGE).pdf $(THESIS).pdf $(REPORT).pdf

wordcount : $(THESIS).tex
	@echo '************  Word count ************' | tee -a $(WORDCOUNTLOG)
	@date +"%Y-%m-%d %H:%M:%S" | tee -a $(WORDCOUNTLOG)
	@if grep -v ^% $< | grep -q '\\documentclass\[[^\[]*english'; then \
		texcount $< -inc -char-only | awk '/total/ {getline; print "英文字符数\t\t\t:",$$4}' | tee -a $(WORDCOUNTLOG); \
	else \
		texcount $< -inc -ch-only   | awk '/total/ {getline; print "纯中文字数\t\t\t:",$$4}' | tee -a $(WORDCOUNTLOG); \
	fi
	@texcount $< -inc -chinese | awk '/total/ {getline; print "总字数（英文单词 + 中文字）\t:",$$4}' | tee -a $(WORDCOUNTLOG)