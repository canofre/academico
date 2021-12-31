ARQUIVO=wscad2008


all: pdf

clean:
	rm -rf *~ 1 *.swp *.swo
pdfvis: pdf vis

vis: pdf
	acroread $(ARQUIVO).pdf
    
pdf: ps
	ps2pdf -sPAPERSIZE=a4 $(ARQUIVO).ps

ps: dvi
	dvips -o $(ARQUIVO).ps $(ARQUIVO).dvi

dvi: 
	latex $(ARQUIVO).tex

limpa:
	rm -rf *.aux *.log *.idx *.ps *.dvi *.pdf *.toc *.bbl *.blg *.out *.nav *.snm 1
l:
	rm -rf *.swp *~ .*.swp .*.swo 1
