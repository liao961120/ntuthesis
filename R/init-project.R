#' Initialize current directory as a bookdown project
#'
#' @export
init_proj <- function() {
  rproj <- system.file("init-project/ntu-bookdown.Rproj.txt", package = "ntuthesis")
  file.copy(from = rproj, to = ".")
  file.rename(from = "ntu-bookdown.Rproj.txt",
              to = paste0(basename(getwd()), ".Rproj"))
}
