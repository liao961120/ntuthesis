#' Pandoc Wrapper
#' @keywords internal
pandoc <- function(infile = 'word.docx', outfile = 'word.pdf') {
  pandoc <- rmarkdown:::find_pandoc()
  if (!is.null(pandoc$dir)) {
    pandoc_exe <- list.files(pandoc$dir, full.names = T)[[1]]
  } else if (!Sys.which("pandoc") == "") {
    pandoc_exe <- list.files(Sys.which("pandoc"), full.names = T)[[1]]
  } else {
    stop("Can't find Pandoc", "\n",
         "Please install Rstudio or Pandoc first")
  }
  system2(pandoc_exe, args = c(infile, '-o', outfile))
}
