## To Do: Times new roman
# https://github.com/potyt/fonts/tree/master/macfonts/Times%20New%20Roman

#' Download traditional Chinese font dependencies Rmd PDF output
#'
#' Make sure this function is called after 1) importing Rmd template
#' and 2) setting the current working directory to that Rmd
#' template folder.
#'
#' @export
donwload_font_all <- function(lookfor = 'template.tex') {
  donwload_font(lookfor)

  # Copy fonts to dir `front_matter`
  fonts <- list.files('latex', pattern = '(otf)|(ttf)$', recursive = T, full.names = T)
  file.copy(fonts, to = 'front_matter')
}


#' Download font dependencies for traditional Chinese Rmd PDF output
#'
#' Make sure this function is called after 1) importing Rmd template
#' and 2) setting the current working directory to that Rmd
#' template folder.
#'
#' @keywords internal
donwload_font <- function(lookfor = 'template.tex') {
  header_tex_path <- list.files(getwd(), lookfor, recursive = T, full.names = T)
  lookfor_str <- paste0('`', lookfor, '`')

  # Check header.tex path
  if (length(header_tex_path) == 0) {
    stop(lookfor_str, ' not found!')
  } else if (length(header_tex_path) > 1) {
    cat('Multiple', lookfor_str, 'found at\n',
        paste0('`', header_tex_path, '`', collapse = '\n'), sep = '\n')
    stop('Multiple ', lookfor_str, 'found!')
  }

  # Switch to destination folder
  ori_dir <- getwd()
  setwd(dirname(header_tex_path))
  on.exit({setwd(ori_dir)}, add = TRUE)

  download_file(ori_dir)
}


download_file <- function(ori_dir) {
  on.exit({setwd(ori_dir)}, add = TRUE)
  cwd <- getwd()

  kaiti <- 'http://sf1.loxa.edu.tw/104736/Download/kaiu.ttf'
  mono <- 'https://liao961120.github.io/deps/fonts/NotoSansMonoCJKtc.zip'

  # Times New Roman Fonts
  tnr <- vector('character', 4)
  tnr[1] <- 'https://github.com/potyt/fonts/raw/master/macfonts/Times%20New%20Roman/Times%20New%20Roman.ttf'
  tnr[2] <- 'https://github.com/potyt/fonts/raw/master/macfonts/Times%20New%20Roman/Times%20New%20Roman%20Italic.ttf'
  tnr[3] <- 'https://github.com/potyt/fonts/raw/master/macfonts/Times%20New%20Roman/Times%20New%20Roman%20Bold.ttf'
  tnr[4] <- 'https://github.com/potyt/fonts/raw/master/macfonts/Times%20New%20Roman/Times%20New%20Roman%20Bold%20Italic.ttf'
  names(tnr) <- c("regular", "italic", "bold", "bold_italic")

  cat('Downloading fonts to', cwd, '\n')

  # Monofont
  temp_mono <- tempfile()
  utils::download.file(mono, destfile = temp_mono)
  utils::unzip(temp_mono, exdir = cwd)

  # kaiti font
  utils::download.file(kaiti, destfile = 'kaiti.ttf')

  # Times New Roman
  for (name in names(tnr)) {
    dest <- paste0('TimesNewRoman-', name, '.ttf')
    utils::download.file(tnr[name], destfile = dest)
  }
}
