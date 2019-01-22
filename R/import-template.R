#' Import Thesis Template
#'
#' \code{import_template} creates a thesis template.
#'   It is a wrapper of \code{\link[rmarkdown]{draft}}.
#'
#' @param name The name of the thesis project to create.
#'   Note `name` can't be path, i.e, `name` can't contain
#'   `/`s.
#'
#' @examples
#' \dontrun{
#' import_template("my-thesis")
#' }
#'
#' @export
import_template <- function(name = "My_Thesis") {
  rmarkdown::draft(name, edit = F,
                   template = "ntu_bookdown",
                   package = "ntuthesis")
  rmd_file <- paste0(name,"/",name,".Rmd")
  if (file.exists(rmd_file)) file.remove(rmd_file)
}
