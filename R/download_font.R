#' Download font dependencies for traditional Chinese Rmd PDF output
#'
#' This function is expected to run once after the package is
#' downloaded. It downloads font files into \code{ntuthesis}'s
#' R Markdown template folders, so when a template is used
#' later, it will contained the necessary fonts to work.
#'
#' @param IPAfont Whether to download a font (Doulos SIL)
#'   that supports IPA (International Phonetic Alphabet).
#' @export
download_fonts <- function(IPAfont = TRUE) {
  font_dest_dir <- system.file('rmarkdown', 'templates', 'ntu', 'skeleton', 'latex', package = 'ntuthesis')
  font_dest_dir2 <- system.file('rmarkdown', 'templates', 'ntu', 'skeleton', 'front_matter', package = 'ntuthesis')

  download_file2(font_dest_dir, IPAfont)

  # Copy the downloaded fonts to front_matter folder
  source <- tools::list_files_with_exts(font_dest_dir, c('ttf', 'otf'))
  file.copy(from = source, to = font_dest_dir2)
}

#' Download font dependencies to the directory where header.tex is
#'
#' Make sure this function is called after 1) importing Rmd template
#' and 2) setting the current working directory to that Rmd
#' template folder.
#'
#' @keywords internal
donwload_font2header <- function() {
  header_tex_path <- list.files(getwd(), 'header.tex', recursive = T, full.names = T)

  # Check header.tex path
  if (length(header_tex_path) == 0) {
    stop('`header.tex` not found!')
  } else if (length(header_tex_path) > 1) {
    cat('Multiple `header.tex` found at\n',
        paste0('`', header_tex_path, '`', collapse = '\n'), sep = '\n')
    stop('Multiple `header.tex` found!')
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

  kaiti <- 'https://liao961120.github.io/deps/fonts/bkai00mp.zip'
  mono <- 'https://liao961120.github.io/deps/fonts/NotoSansMonoCJKtc.zip'

  cat('Downloading fonts to', cwd, '\n')
  temp_kai <- tempfile()
  temp_mono <- tempfile()
  utils::download.file(kaiti, destfile = temp_kai)
  utils::download.file(mono, destfile = temp_mono)

  # Decompress
  utils::unzip(temp_kai, exdir = cwd)
  utils::unzip(temp_mono, exdir = cwd)
}



download_file2 <- function(dest_dir, IPA = TRUE) {

  kaiti <- 'https://liao961120.github.io/deps/fonts/kaiti.zip'
  mono <- 'https://liao961120.github.io/deps/fonts/NotoSansMonoCJKtc.zip'
  enfont <- 'https://depend.netlify.com/fonts/TimesNewRoman.zip'
  ipafont <- 'https://liao961120.github.io/deps/fonts/DoulosSIL.zip'

  cat('Downloading fonts to', dest_dir, '\n')
  temp_kai <- tempfile()
  temp_mono <- tempfile()
  temp_enfont <- tempfile()

  utils::download.file(kaiti, destfile = temp_kai)
  utils::download.file(mono, destfile = temp_mono)
  utils::download.file(enfont, destfile = temp_enfont)

  # Decompress
  utils::unzip(temp_kai, exdir = dest_dir)
  utils::unzip(temp_mono, exdir = dest_dir)
  utils::unzip(temp_enfont, exdir = dest_dir)

  # Download IPA?
  if (IPA) {
    temp_ipa <- tempfile()
    utils::download.file(ipafont, destfile = temp_ipa)
    utils::unzip(temp_ipa, exdir = dest_dir)
  }
}
