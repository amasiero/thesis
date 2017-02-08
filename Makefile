NAME  = Principal
SHELL = bash
PWD   = $(shell pwd)

all: text clean

clean:
	rm -f *.{acn,acr,alg,aux,bbl,bcf,blg,fls,glg,glo,gls,glsdefs,hd,idx,ilg,ind,ins,ist,log,loa,loe,lof,lot,mw,nav,out,sbl,snm,sym,toc,xdy,fdb_latexmk,gz,run.xml}

text:
ifeq '$(OS)' 'GNU/Linux'
	pdflatex -synctex=1 -interaction=nonstopmode $(NAME).tex
	# bibtex $(NAME).aux
	biber $(NAME)
	pdflatex -synctex=1 -interaction=nonstopmode $(NAME).tex
	pdflatex -synctex=1 -interaction=nonstopmode $(NAME).tex
else
	# Works on El Captain
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	# "/Library/TeX/texbin/bibtex" $(NAME).aux
	"/Library/TeX/texbin/biber" $(NAME)
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
	"/Library/TeX/texbin/pdflatex" -synctex=1 -interaction=nonstopmode $(NAME).tex
endif
	test -e Principal.pdf && mv Principal.pdf Tese.pdf
