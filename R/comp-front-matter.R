#' Compile front matter to PDF
#'
#' To use this function, one needs to be in the
#' \emph{root directory} of the bookdown project.
#'
#' @examples
#' \dontrun{
#' setwd("~/my-thesis")
#' comp_front()
#' }
#'
#' @export
comp_front <- function() {

  stopifnot(dir.exists("front_matter"))
  setwd("front_matter")

  # Construct front_matter.rmd
  construct_front_rmd()

  # Compile to PDF
  rmarkdown::render("front_matter.rmd", encoding = "UTF-8")
  stopifnot(file.exists("certification.tex"))
  fp <- "certification.tex"
  system2("xelatex", args = fp, stdout = FALSE)
  #system(paste("xelatex", fp))

  setwd("..")
}


#' Construct 'front_matter.rmd'
#'
#' Construct \code{front_matter.rmd} from \code{front_matter/output.yml}
#' and \code{_person-info} in root. This function is expected to work
#' in the directory \code{front_matter/}.
#'
#' @param person_info File path to \code{_person-info.yml}.
#'
#' @keywords internal
construct_front_rmd <- function(person_info = '../_person-info.yml'){
  if (!file.exists(person_info)) stop("'_person-info.yml' not in root")

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
}
