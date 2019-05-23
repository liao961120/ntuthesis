#' Render Book With Docker
render_thesis_docker <- function() {
  tryCatch(
    {bookdown::render_book('index.Rmd', 'ntuthesis::tex_book')},
    error = function(e) {}
    )
  docker_xelatex("tex_book.tex")
}
