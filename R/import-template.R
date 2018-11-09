#' Import Thesis Template
#'
#' \code{import_template} creates a thesis template. It is a
#'   wrapper of \code{\link{rmarkdown::draft}}.
#'
#' @param name The name of the thesis project to create.
#'
#' @examples
#' \dontrun{
#' import_template("my-thesis")
#' }
#'
#' @export
import_template <- function(name = "My_Thesis") {
  rmarkdown::draft(name,
                   template = "ntu_bookdown",
                   package = "ntuthesis")
}
