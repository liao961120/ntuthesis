#' Modified Version of `bookdown::pdf_book`
#' @param toc See bookdown::pdf_book
#' @param number_sections See bookdown::pdf_book
#' @param fig_caption See bookdown::pdf_book
#' @param pandoc_args See bookdown::pdf_book
#' @import bookdown
#' @export
tex_book <- function (rename = 'tex_book.tex', toc = TRUE,
                      number_sections = TRUE, fig_caption = TRUE,
    pandoc_args = NULL, ..., base_format = rmarkdown::pdf_document,
    toc_unnumbered = TRUE, toc_appendix = FALSE, toc_bib = FALSE,
    quote_footer = NULL, highlight_bw = FALSE)
{
    base_format = bookdown:::get_base_format(base_format)
    config = base_format(toc = toc, number_sections = number_sections,
        fig_caption = fig_caption, pandoc_args = bookdown:::pandoc_args2(pandoc_args),
        ...)
    config$pandoc$ext = ".tex"
    post = config$post_processor
    config$post_processor = function(metadata, input, output,
        clean, verbose) {
        if (is.function(post))
            output = post(metadata, input, output, clean, verbose)
        f = xfun::with_ext(output, ".tex")
        x = bookdown:::resolve_refs_latex(xfun::read_utf8(f))
        x = bookdown:::resolve_ref_links_latex(x)
        x = bookdown:::restore_part_latex(x)
        x = bookdown:::restore_appendix_latex(x, toc_appendix)
        if (!toc_unnumbered)
            x = bookdown:::remove_toc_items(x)
        if (toc_bib)
            x = bookdown:::add_toc_bib(x)
        x = bookdown:::restore_block2(x, !number_sections)
        if (!is.null(quote_footer)) {
            if (length(quote_footer) != 2 || !is.character(quote_footer))
                warning("The 'quote_footer' argument should be a character vector of length 2")
            else x = bookdown:::process_quote_latex(x, quote_footer)
        }
        if (highlight_bw)
            x = bookdown::highlight_grayscale_latex(x)
        post = getOption("bookdown.post.latex")
        if (is.function(post))
            x = post(x)
        xfun::write_utf8(x, f)
        # Copy the output tex
        file.copy(f, rename)
    }
    pre = config$pre_processor
    config$pre_processor = function(...) {
        c(if (is.function(pre)) pre(...), "--variable", "tables=yes",
            "--standalone")
    }
    config$bookdown_output_format = "latex"
    config = bookdown:::set_opts_knit(config)
    config
}

#' Modified Version of `bookdown::pdf_document2`
#' @export
tex_document <- function (...)
{
    tex_book(..., base_format = rmarkdown::pdf_document)
}
