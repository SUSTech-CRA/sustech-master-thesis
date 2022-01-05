# Makefile for SUSTechThesis

PACKAGE = sustechthesis
THESIS  = sustechthesis-example

SOURCES = $(PACKAGE).ins $(PACKAGE).dtx
CLSFILE = dtx-style.sty $(PACKAGE).cls

LATEXMK = latexmk
SHELL  := /bin/bash

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: all all-dev clean cleanall thesis viewthesis dist dist-github doc viewdoc cls test wordcount FORCE_MAKE

thesis: $(THESIS).pdf

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
	zip -r dist/sustech-thesis-dev-build.zip . -x *.git* /*node_modules/* .editorconfig *public-test/* *dist/*

$(PACKAGE).pdf: cls FORCE_MAKE
	$(LATEXMK) $(PACKAGE).dtx

$(THESIS).pdf: cls FORCE_MAKE
	$(LATEXMK) $(THESIS)

viewdoc: doc
	$(LATEXMK) -pv $(PACKAGE).dtx

viewthesis: thesis
	$(LATEXMK) -pv $(THESIS)

test: cls FORCE_MAKE
	bash test/test.sh

clean:
	$(LATEXMK) -c $(PACKAGE).dtx $(THESIS)
	-@$(RM) -rf *~ main-survey.* main-translation.* *_markdown_* *.markdown.*
	-@$(RM) -rf *.aux *.bbl *.blg

cleanall: clean
	-@$(RM) $(CLSFILE)
	-@$(RM) -rf public-test dist
	-@$(RM) $(PACKAGE).pdf $(THESIS).pdf

wordcount : $(THESIS).tex
	@if grep -v ^% $< | grep -q '\\documentclass\[[^\[]*english'; then \
		texcount $< -inc -char-only | awk '/total/ {getline; print "英文字符数\t\t\t:",$$4}'; \
	else \
		texcount $< -inc -ch-only   | awk '/total/ {getline; print "纯中文字数\t\t\t:",$$4}'; \
	fi
	@texcount $< -inc -chinese | awk '/total/ {getline; print "总字数（英文单词 + 中文字）\t:",$$4}'