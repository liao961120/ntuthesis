#' Compile Word into PDF
#'
#' Pandoc Wrapper function
#'
#' @param infile String. File path to the input word document.
#'   Must be in \code{.docx} format.
#' @param outfile String. File path of the output pdf document
#'   to be generated. Must be in \code{.pdf} format.
#' @importFrom tools file_ext
#' @export
word2pdf <- function(infile = 'word.docx', outfile = 'word.pdf') {
  stopifnot(file.exists(infile))
  if (file_ext(infile) != 'docx') stop('Input file not `docx` format')
  if (file_ext(outfile) != 'pdf') stop('Output file not `pdf` format')

  pandoc <- rmarkdown:::find_pandoc()
  if (!is.null(pandoc$dir)) {
    pandoc_files <- list.files(pandoc$dir, full.names = T)[[1]]
    idx <- grepl('^pandoc(\\.exe)?$', basename(pandoc_files))
    pandoc_exe <- pandoc_files[idx]
  } else if (!Sys.which("pandoc") == "") {
    pandoc_exe <- list.files(Sys.which("pandoc"), full.names = T)[[1]]
  } else {
    stop("Can't find Pandoc", "\n",
         "Please install Rstudio or Pandoc first")
  }
  system2(pandoc_exe, args = c(infile, '-o', outfile, '--pdf-engine=xelatex'))
}
