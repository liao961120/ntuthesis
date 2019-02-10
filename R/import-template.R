#' Import Thesis Template
#'
#' \code{import_template} creates a thesis template.
#'   It is a wrapper of \code{\link[rmarkdown]{draft}}.
#'
#' @param name The name of the thesis project to create.
#'   Note \code{name} can't be path, i.e, \code{name}
#'   can't contain \code{/}s.
#' @param template String. The template used. Defaults to
#'   \code{ntu}.
#'
#' @examples
#' \dontrun{
#' import_template("my-thesis")
#' }
#'
#' @export
import_template <- function(name = "My_Thesis", template = c("ntu")) {
  stopifnot(is.character(template))
  rmarkdown::draft(name, edit = F,
                   template = template,
                   package = "ntuthesis")
  rmd_file <- paste0(name, "/", name, ".Rmd")
  if (file.exists(rmd_file)) file.remove(rmd_file)
}
