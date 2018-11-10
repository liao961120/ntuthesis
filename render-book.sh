#!/bin/bash

echo '<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5be51e444952fe03"></script>' >> README.md

cd example-thesis
Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")'
cd -

cp -r example-thesis/_book .
