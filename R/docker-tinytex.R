#' Wrapper of Docker  to Compile PDF
#'
#' Make sure to have docker installed and docker image
#' pulled to local or the function will throw error.
#' The docker image can be pulled with the command
#' \code{docker pull liao961120/tinytex}.
#'
#' The default docker image can be changed by setting
#' \code{options(ntuthesis.docker = 'liao961120/tinytex')}.
#'
#' @param fpath String. The path to \code{.tex} file.
#' @references \url{https://hub.docker.com/r/liao961120/tinytex}
#' @export
docker_xelatex <- function(fpath) {
  stopifnot(file.exists(fpath), xfun::file_ext(fpath) == 'tex')
  if (!has_docker()) stop("docker not found!")

  docker <- getOption("ntuthesis.docker")
  if (is.null(docker)) docker <- "liao961120/tinytex"

  args <- c("run", "--rm", "-u", "`id -u $USER`", "-v", "`pwd`:/tinytex-docker/", docker, "Rscript", "-e", paste0('\'setwd("/tinytex-docker/");options(tinytex.tlmgr.path = "/.TinyTeX/bin/x86_64-linux/tlmgr");tinytex::xelatex("', fpath, '")\''))

  system2('docker', args, stdout = TRUE)
}


has_docker <- function ()
{
    x = system("docker -v", intern = TRUE)
    if (grepl("Docker version", x))
        docker = TRUE
    else docker = FALSE

    if (!docker) {
      ostype = check_os()
      url_mac = "https://docs.docker.com/docker-for-mac/install/"
      url_win = "https://docs.docker.com/docker-for-windows/install/"
      url_lnx = "https://docs.docker.com/engine/installation/#server"
      if (ostype == "mac") {
          cat("Please follow the instructions on", url_mac, "\nto install Docker for Mac (admin privileges required).")
      }
      if (ostype == "win") {
          cat("Please follow the instructions on", url_win, "\nto install Docker for Windows (admin privileges required).")
      }
      if (ostype == "lnx") {
          cat("Please follow the instructions on", url_lnx, "\nto install Docker for your Linux distribution (admin privileges required).")
      }
      cat('\n')
      invisible()
    }

  return(docker)
}

check_os <- function ()
{
    if (Sys.info()[["sysname"]] == "Darwin")
        "mac"
    else if (.Platform$OS.type == "windows")
        "win"
    else "lnx"
}
