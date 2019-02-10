#' Compile front matter to PDF
#'
#' To use this function, one needs to be in the
#' \emph{root directory} of the bookdown project.
#'
#' @param template String. The template used. Defaults to
#'   \code{ntu}.
#'
#' @examples
#' \dontrun{
#' setwd("~/my-thesis")
#' comp_front(template = 'ntu')
#' }
#' @export
comp_front <- function(template = c("ntu")) {
  stopifnot(is.character(template))
  func <- list(
    ntu = function() comp_front_ntu()
  )
  func[[template[1]]]()
}


#' Clean up intermediate files created by \code{comp_front_*}
#' @keywords internal
clean_front_matter <- function(files) {
  idx <- file.exists(files)
  file.remove(files[idx])
}
