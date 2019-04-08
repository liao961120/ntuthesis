#' Initialize current directory as a bookdown project
#'
#' @param dir The path to the dircetory to initialize as
#'   a project.
#' @param download_font Logical. Whether to download \code{kaiu.ttf}
#'   for CJK mainfont & \code{NotoSansMonoCJKtc.otf} for CJK mono font.
#'   Defaults to \code{TRUE}.
#'
#' @examples
#' \dontrun{
#' setwd("~/my-thesis")
#' init_proj()
#' }
#'
#' @export
init_proj <- function(dir = ".", download_font = TRUE) {
  rproj <- system.file("init-project/ntu-bookdown.Rproj.txt",
                       package = "ntuthesis")
  file.copy(from = rproj, to = dir)
  file.rename(from = "ntu-bookdown.Rproj.txt",
              to = paste0(basename(getwd()), ".Rproj"))

  # Download Chinese font dependencies
  if (download_font) donwload_font_all()
}
