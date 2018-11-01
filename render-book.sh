#!/bin/bash

cd example-thesis
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'
cd -

cp -r example-thesis/_book .
