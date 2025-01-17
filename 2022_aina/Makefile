# Makefile for LaTeX files

# Original Makefile from http://www.math.psu.edu/elkin/math/497a/Makefile

# Please check http://www.acoustics.hut.fi/u/mairas/UltimateLatexMakefile
# for new versions.

# Copyright (c) 2005 Matti Airas <Matti.Airas@hut.fi>

# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions: 

# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software. 

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 

# $Id: Makefile,v 1.16 2005/12/07 10:57:32 mairas Exp $

LATEX	= pdflatex
BIBTEX	= bibtex
MAKEINDEX = makeindex
XDVI	= xdvi -gamma 4

RERUN = "(There were undefined references|Rerun to get (cross-references|the bars) right)"
RERUNBIB = "No file.*\.bbl|Citation.*undefined"
MAKEIDX = "^[^%]*\\makeindex"
MPRINT = "^[^%]*print"
USETHUMBS = "^[^%]*thumbpdf"

COPY = if test -r $(<:%.tex=%.toc); then cp $(<:%.tex=%.toc) $(<:%.tex=%.toc.bak); fi 
RM = rm -f
OUTDATED = echo "EPS-file is out-of-date!" && false

# These are OK
SRC	:= $(shell egrep -l '^[^%]*\\begin\{document\}' *.tex)
TRG	= $(SRC:%.tex=%.dvi)

define run-latex
	  $(COPY);$(LATEX) $<
	  egrep -q $(MAKEIDX) $< && ($(MAKEINDEX) $(<:%.tex=%);$(COPY);$(LATEX) $<) ; true
	  egrep -c $(RERUNBIB) $(<:%.tex=%.log) && ($(BIBTEX) $(<:%.tex=%);$(COPY);$(LATEX) $<) ; true
	  egrep -q $(RERUN) $(<:%.tex=%.log) && ($(COPY);$(LATEX) $<) ; true
	  egrep -q $(RERUN) $(<:%.tex=%.log) && ($(COPY);$(LATEX) $<) ; true
	  if cmp -s $(<:%.tex=%.toc) $(<:%.tex=%.toc.bak); then true ;else $(LATEX) $< ; fi
	  $(RM) $(<:%.tex=%.toc.bak)
	  # Display relevant warnings
	  egrep -i "(Reference|Citation).*undefined" $(<:%.tex=%.log) ; true
endef

define get_dependencies
	deps=`perl -ne '($$_)=/^[^%]*\\\include\{(.*?)\}/;@_=split /,/;foreach $$t (@_) {print "$$t.tex "}' $<`
endef

define getbibs
	bibs=`perl -ne '($$_)=/^[^%]*\\\bibliography\{(.*?)\}/;@_=split /,/;foreach $$b (@_) {print "$$b.bib "}' $< $$deps`
endef

define geteps
	epses=`perl -ne '@foo=/^[^%]*\\\(includegraphics|psfig)(\[.*?\])?\{(.*?)\}/g;if (defined($$foo[2])) { if ($$foo[2] =~ /.eps$$/) { print "$$foo[2] "; } else { print "$$foo[2].eps "; }}' $< $$deps`
endef

all : clean $(TRG)
	rm -rf *.aux *.bbl *.blg *.acr *.brf  *.idx *.ilg *.ind *.lo* *.toc *.out.ps *.nlo *.dvi *.acr

.PHONY	: all show clean ps pdf showps

clean	:
	-rm -rf *.aux *.bbl *.blg *.acr *.brf  *.idx *.ilg *.ind *.lo* *.toc *.out.ps *.nlo *.dvi *.acr *.pdf *.d

# This is a rule to generate a file of prerequisites for a given .tex file
%.d	: %.tex
	$(get_dependencies) ; echo $$deps ; \
	$(getbibs) ; echo $$bibs ;\
	$(geteps) ; \
	echo "$*.dvi $@ : $< $$deps $$bibs $$epses" > $@

include $(SRC:.tex=.d)

# $(DEP) $(EPSPICS) $(BIBFILE)
$(TRG)	: %.dvi : %.tex
	  @$(run-latex)

show	: $(TRG)
	  @for i in $(TRG) ; do $(XDVI) $$i & done

