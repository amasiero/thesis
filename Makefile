NAME  = Principal
SHELL = bash
PWD   = $(shell pwd)

all: text clean

clean:
	rm -f *.{acn,acr,alg,aux,bbl,blg,fls,glg,glo,gls,glsdefs,hd,idx,ilg,ind,ins,ist,log,loa,loe,lof,lot,mw,nav,out,sbl,snm,sym,toc,xdy,fdb_latexmk,gz}

text:
	"/usr/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	"/usr/texbin/bibtex" $(NAME).aux
	"/usr/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	"/usr/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	test -e Principal.pdf && mv Principal.pdf Tese.pdf