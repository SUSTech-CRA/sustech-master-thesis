# Makefile for ThuThesis

PACKAGE = thuthesis
THESIS  = thuthesis-example


LATEXMK = latexmk
SHELL  := /bin/bash

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
else
	RM = rm -f
endif

.PHONY: all clean cleanall thesis viewthesis wordcount test FORCE_MAKE

thesis: $(THESIS).pdf

all: thesis

test:
	bash test/test.sh

$(THESIS).pdf: FORCE_MAKE
	$(LATEXMK) $(THESIS)

viewthesis: thesis
	$(LATEXMK) -pv $(THESIS)

clean:
	$(LATEXMK) -c $(THESIS)
	-@$(RM) -rf *~ main-survey.* main-translation.* _markdown_thuthesis* thuthesis.markdown.*

cleanall: clean
	-@$(RM) $(THESIS).pdf

wordcount : $(THESIS).tex
	@if grep -v ^% $< | grep -q '\\documentclass\[[^\[]*english'; then \
		texcount $< -inc -char-only | awk '/total/ {getline; print "英文字符数\t\t\t:",$$4}'; \
	else \
		texcount $< -inc -ch-only   | awk '/total/ {getline; print "纯中文字数\t\t\t:",$$4}'; \
	fi
	@texcount $< -inc -chinese | awk '/total/ {getline; print "总字数（英文单词 + 中文字）\t:",$$4}'