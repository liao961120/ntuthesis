#' Initialize current directory as a bookdown project
#'
#' @param dir The path to the dircetory to initialize as a project
#' @export
init_proj <- function(dir = ".") {
  rproj <- system.file("init-project/ntu-bookdown.Rproj.txt",
                       package = "ntuthesis")
  file.copy(from = rproj, to = dir)
  file.rename(from = "ntu-bookdown.Rproj.txt",
              to = paste0(basename(getwd()), ".Rproj"))
}
