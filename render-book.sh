#!/bin/bash

cd inst/example-thesis
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'
cd -

cp -r inst/example-thesis/_book .
