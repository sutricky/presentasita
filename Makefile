TEXS := *.tex chapter/*.tex
FIGS := fig/*

.PHONY: all setup

all: clean book

clean:
	rm -f *.pdf *.ilg *.nlo *.nls *.log *.bbl *.blg

book:
	Rscript -e "tinytex::pdflatex('main.tex')"

lock:
	pipenv lock
	pipenv run roo lock

setup:
	pipenv install
	pipenv run roo install
	Rscript -e "tinytex::install_tinytex(dir = '${PWD}:.TinyTex')"
