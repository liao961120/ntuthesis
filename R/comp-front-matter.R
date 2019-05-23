#' Compile front matter to PDF
#'
#' To use this function, one needs to be in the
#' \emph{root directory} of the bookdown project.
#'
#' @param use_docker Logical. Whether to use tinytex docker
#'   to compile PDF.
#' @param template String. The template used. Defaults to
#'   \code{ntu}.
#'
#' @examples
#' \dontrun{
#' setwd("~/my-thesis")
#' comp_front(template = 'ntu')
#' }
#' @export
comp_front <- function(use_docker = FALSE, template = c("ntu")) {
  stopifnot(is.character(template))
  func <- list(
    ntu = function(x) comp_front_ntu(x)
  )
  func[[template[1]]](use_docker)
}


#' Clean up intermediate files created by \code{comp_front_*}
#' @keywords internal
clean_front_matter <- function(files) {
  idx <- file.exists(files)
  file.remove(files[idx])
}
