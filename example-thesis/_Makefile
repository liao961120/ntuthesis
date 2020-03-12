.PHONY: book clean

all: clean front book

front:
	Rscript -e 'ntuthesis::comp_front()'

book: 
	Rscript -e 'ntuthesis::render_thesis()' # not implementated yet

clean:
	rm -r _book _bookdown_files *.log

