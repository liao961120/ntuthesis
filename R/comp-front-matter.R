#' Compile front matter to PDF
#'
#' To use this function, one needs to be in the
#' \emph{root directory} of the bookdown project.
#'
#' @export
comp_front <- function() {

  # Construct front_matter.rmd
  construct_front_rmd()

  stopifnot(dir.exists("front_matter"))
  setwd("front_matter")

  # Compile to PDF
  rmarkdown::render("front_matter.rmd")
  stopifnot(file.exists("certification.tex"))
  fp <- "certification.tex"
  system(paste("xelatex", fp))

  setwd("..")
}


#' Construct 'front_matter.rmd'
#'
#' Construct \code{front_matter.rmd} from \code{front_matter/output.yml}
#' and \code{person-info} in root.
#'
#' @param person_info File path to \code{person-info.yml}.
#'
#' @keywords internal
construct_front_rmd <- function(person_info = '../person-info.yml'){
  stopifnot(dir.exists("front_matter"))
  setwd("front_matter")

  if (!file.exists('../person-info.yml')) stop("'person-info.yml' not in root")

  person_info <- paste(readLines(person_info),
                       collapse = "\n")
  endlines <- paste(readLines("output.yml"),
                    collapse = "\n")

  write('---',
        file = "front_matter.rmd")
  write(person_info,
        file = "front_matter.rmd", append = T)
  write(endlines,
        file = "front_matter.rmd", append = T)
  write('---',
        file = "front_matter.rmd", append = T)
  setwd("..")
}
