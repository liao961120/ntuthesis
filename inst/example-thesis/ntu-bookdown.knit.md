--- 
title: '臺灣大學論文 Bookdown 模板'
author: '廖永賦'
github-repo: "liao961120/ntuthesis"
date: "November  1, 2018" # Gitbook Date
## Opts above are for gitbook output; below are for PDF output
two-side: false  # Whether to start new chapter on odd pages
cjk-mainfont: 'AR PL KaitiM Big5'  # Default: 標楷體
cjk-boldfont: 'AR PL KaitiM Big5'
cjk-style: 'AutoFakeBold=2.5, AutoFakeSlant=.3' #
en-mainfont: 'Liberation Serif'  # Default: Times New Roman
ipa-font: 'Doulos SIL'  # works with 'linguisticsdown', delete if not needed
secnumdepth: 2   # section numbering at most to x.y.z
indent: false    # Indent new paragraph, else adds space between paragraphs 
linestretch: 2   # If Chinese: 1.5
linestretch-code: 1.5  # linestretch for code chunks
watermark: watermark.pdf    # ntu watermark file (must be in root dir)
link-citations: yes         # internal links to references
bibliography: ref.bib
## Shouldn't touch things below unless familiar with R Markdown
#biblio-style: apa #authoryear
#biblatexoptions: [backend = biber, style = caspervector, utf8, sorting = cenyt]
#biblio-title: "biblatex 參考文獻"
links-as-notes: true
always_allow_html: yes
geometry: a4paper, left=1.18in, right=1.18in, top=1.18in, bottom=0.787in
fontsize: 12pt
subparagraph: yes
site: bookdown::bookdown_site
---


<!-- 
Below are code that paste acknowledgement and abstract in GitBook output. 
Remove or wrap them around HTML comments if don't want to display them in GitBook.
-->

<!-- Acknowledgement -->




<!-- Abstract -->




<!-- keywords -->








<!--chapter:end:index.Rmd-->

<!--html_preserve--><script>
  addClassKlippyTo("pre.r, pre.markdown, pre.yaml, pre.latex");
  addKlippy('right', 'top', 'auto', '1', 'Copy code', 'Copied!');
</script><!--/html_preserve-->

# 安裝 {#install}


```r
devtools::install_github("liao961120/ntuthesis")
```

## LaTeX

若已有管理、安裝 LaTeX 套件經驗者，可忽略。

若電腦尚未安裝 LaTeX，可安裝 R 的 tinytex 套件：

```r
install.packages('tinytex')
tinytex::install_tinytex()
```

在輸出 R Markdown 時，tinytex 會自動安裝缺少的 LaTeX 套件。因此，第一次輸出 PDF 可能會需要一些時間。


# 輸出論文 {#export-thesis}

## 匯入論文模板 {#import-template}

開啟 RStudio，選取左上方 `File` > `New File` > `R Markdown`：


```r
if (knitr::is_html_output()) {
  knitr::include_graphics("figs/rmd-template.gif")
} else {
  knitr::include_graphics("figs/rmd-template.png")
}
```



\begin{center}\includegraphics[width=1\linewidth]{figs/rmd-template} \end{center}

或是直接在 console 執行：
```r
rmarkdown::draft("project_name",
                 template = "ntu_bookdown",
                 package = "ntuthesis")
```

接著需要將該資料夾變更為 bookdown 專案。這可以用 RStudio 左上方 `File` > `New Project` > `Existing Directory` 達成，或直接使用下方指令（working dir 需是專案資料夾）：
```r
ntuthesis::init_proj()  # init working dir as proj.
```

詳細的檔案結構，見 \@ref(dir-structure)。

## 編輯封面 {#edit-front-matter}

在`_person-info.yml`輸入個人資料後，執行：
```r
ntuthesis::comp_front()
```

即會在 `front-matter/` 生成封面所需的檔案。以使用者的角度而言，除了 `front-matter/certification.pdf` 以外，`front-matter/` 中的其它檔案不須理會。`certification.pdf` 是空白（未簽名）的「口試委員審定書」。

已簽名的「口試委員審定書」，將檔案命名為 `certification-scan.pdf` 並放在專案資料夾的最頂層。

## Compile 論文 {#compile-thesis}

接著用 RStudio Environment Pane 裡的 button 輸出論文：


```r
if (knitr::is_html_output()) {
  knitr::include_graphics("figs/build-button.gif")
} else {
  knitr::include_graphics("figs/build-button.png")
}
```



\begin{center}\includegraphics[width=1\linewidth]{figs/build-button} \end{center}

或是在 console 執行下方指令：
```r
bookdown::render_book("index.Rmd", "bookdown::gitbook")
bookdown::render_book("index.Rmd", "bookdown::bookdown::pdf_book")
```

如此便會在 `_book/` 中生成完整的論文（gitbook 和 PDF 格式）。



<!--chapter:end:01-install-compile.Rmd-->

<!--html_preserve--><script>
  addClassKlippyTo("pre.r, pre.markdown, pre.yaml, pre.latex");
  addKlippy('right', 'top', 'auto', '1', 'Copy code', 'Copied!');
</script><!--/html_preserve-->

# 論文撰寫 {#write-thesis}

## 檔案結構 {#dir-structure}

執行以下指令後（詳見 \@ref(import-template)）
```r
rmarkdown::draft("project_name",
                 template = "ntu_bookdown",
                 package = "ntuthesis")
```

即會匯入論文模板，以下是論文模板的檔案結構（已簡化）。

```yaml
├── project_name.Rmd     # Useless, please delete it
|
├── R/                   # code chunk root dir, put R scripts and data here
├── figs/                # Put figures to include in the thesis here
|
├── index.Rmd            # Book Layout (font, watermark, biblio, ...)
├── _acknowledge.Rmd     # acknowledgement
├── _abstract-en.Rmd     # abstract
├── _abstract-zh.Rmd     # Same as above, but in Chinese
|
├── 01-intro.Rmd         # Chapter 1 content
├── 02-literature.Rmd    # Chapter 2 content
├── 03-method.Rmd        # Chapter 3 content
├── 99-references.Rmd    # Don't need to edit
├── ref.bib              # References
├── cite-style.csl       # Citation style
|
├── _bookdown.yml        # label names in gitbook; Rmd files order
├── _output.yml          # preamble, pandoc args, cite-pkg
|
├── watermark.pdf        # 臺大浮水印 (PDF 右上角)
├── _person-info.yml      # Info to generate front matter
├── certification-scan.pdf  # 已簽名'口試委員審查書'
└── front_matter
    └── certification.pdf   # 空白'口試委員審查書'
```

## `index.Rmd` {#index-rmd}

`index.Rmd` 是設定論文內文格式的地方，包含 yaml 以及 R setup code chunk。此模板將 code chunk 預設的 working directory 改成 `R/`[^code-root-dir]，如此較符合一般寫 Rscript 的邏輯[^relative-path]。若要更改此設定，至 setup code chunk 更改 `knitr::opts_knit$set(root.dir='R')`。

[^code-root-dir]: 預設是 Rmd 檔所在的位置。

[^relative-path]: 例如，使用相對路徑匯入資料時，一般會以 Rscript 所在的位置作為基準。

## 撰寫語言 {#write-lang}

若使用**英文**撰寫論文，需修改 `_output.yml`、`_bookdown.yml` 這兩個檔案的內容。

### `_output.yml`

將 `in_header: latex/preamble-zh.tex` 改為 `in_header: latex/preamble-en.tex`：

```yaml
bookdown::pdf_book:
  includes:
    in_header: latex/preamble-en.tex
```

### `_bookdown.yml`

`_bookdown.yml` 中，可以對標籤的名稱進行定義。這裡的設定與 PDF 輸出無關，只與 gitbook 輸出格式有關。因此，若無需使用 gitbook 輸出，可忽略此段。

此外，`_bookdown.yml` 亦可設定 Rmd 檔在輸出文件中的順序。若無設定，就會依序檔名排序[^order]。

在以下設定中，可使 gitbook 輸出的章節（順序）與 PDF 不同。
```yaml
rmd_files:
  html: ["index.Rmd", "abstract.Rmd", "intro.Rmd"]
  latex: ["abstract.Rmd", "intro.Rmd"]
```

[^order]: 此模板即未進行設定，因此第一章的內容寫在 `01-xxx.Rmd` 就會自動排在第一。而若檔名以底線開頭（`_`）則會被忽略。更多內容詳見 [bookdown](https://bookdown.org/yihui/bookdown/usage.html)。


## 文獻引用 {#bib-cite}

R Markdown 在文章中插入引用文獻的功能承繼 Pandoc。完整的使用見 [R Markdown 官方說明](https://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html) 。


此模板目前產生文獻格式的方法是依靠 [Pandoc citeproc](https://github.com/jgm/pandoc-citeproc)，因此，文獻格式是依據 `cite-style.csl`[^csl-ori] 產生的。使用者可至 [Zotero Style Repository](https://www.zotero.org/styles) 下載所需的 csl 檔並覆蓋專案資料夾中的 `cite-style.csl`。

[^csl-ori]: 此模板提供的 `cite-style.csl` 是 APA 英文第六版。此外，[這裡](http://blog.pulipuli.info/2011/05/zoteroapa.html)亦有提供 APA 中文版的引用格式。需注意的是 Pandoc **不支援[雙語 csl](http://blog.pulipuli.info/2014/08/zoteroapa-zotero-citation-style-apa.html)**。

### `ref.bib` {#ref-bib}

`.bib` 檔的產生方式可以由 Endnote, Zotero, JabRef 等書目管理軟體匯出。匯出後，將檔名命名為 `ref.bib` 放在專案資料夾[^refbib]。


[^refbib]: 或是可以自訂檔名，並到 `index.Rmd` yaml 中的 `bibliography: ref.bib` 更改 `ref.bib` 檔名。此外，亦可使用多個 `.bib` 檔：`bibliography: [ref1.bib, ref2.bib, ref3.bib]`。

`.bib` 內的一篇引用資料會類似：

```bib
@article{leung2008,
  title = {Multicultural Experience Enhances Creativity: {{The}} When and How.},
  volume = {63},
  issn = {1935-990X(Electronic),0003-066X(Print)},
  doi = {10.1037/0003-066X.63.3.169},
  number = {3},
  journaltitle = {American Psychologist},
  date = {2008},
  pages = {169-181},
  keywords = {*Cognition,*Creativity,*Culture (Anthropological),*Experiences (Events),Multiculturalism},
  author = {Leung, Angela Ka-yee and Maddux, William W. and Galinsky, Adam D. and Chiu, Chi-yue}
}
```

其中第一行的 `leung2008` 即為 citation key。透過 `@citekey`(`@leung2008`)即可在文獻中插入 citation。匯出論文時，文末會自動產生引用的文獻。

### 引用語法 {#cite-syntax}

[`citr`](https://github.com/crsh/citr) 是一個方便使用者插入引用文獻的 R 套件，讓使用者能透過 GUI 插入文獻：

```r
if (knitr::is_html_output()){
  knitr::include_graphics("figs/citr.gif")
} else {
  knitr::include_graphics("figs/citr.png")
}
```



\begin{center}\includegraphics[width=1\linewidth]{figs/citr} \end{center}

當需要更複雜的引用格式，如標示第幾頁，可以修改透過 `citr` 插入的語法：

- `Some text [@citekey].`
    - Some text [@leung2008].

- `@citekey Some text`
    - @leung2008 Some text 

- `@citekey [p. 20] Some text.`
    - @leung2008 [p. 20] Some text.

- `Some text [-@citekey].`
    - Some text [-@leung2008]

- `Some text [@citekey1; @citekey2].`
    -  Some text [@leung2008; @huangxuanfan1993].

- Prefix & Suffix
    - `Text [see @citekey1 pp.45; also, @citekey2 ch. 2].`
    -  Text [see @leung2008 pp. 45; also, @huangxuanfan1993 ch. 2].

### 書目管理軟體 {#ref-manager}

這裡建議使用 Zotero 加上 [Better BibTeX](https://retorque.re/zotero-better-bibtex/) 擴充功能。`citr` 對 Zotero 有額外的支持，且 **Zotero 能夠控制 citation key 的格式**（例如，last name + year），但其它書目管理軟體如 Endnote 產生的 citation key 對難以讀懂且無法更改其格式。

### 多語言文獻引用 {#multi-lang-cite}

透過 csl 排版引用格式，只能支援單一語言。例如，若將英文格式套用到中文文獻，中文文獻就會出現英文的半形逗點和句點。

多語言的引用可能可透過 LaTeX 的引用套件達成，但由於作者本人對 LaTeX 不夠熟悉，目前尚未解決此問題。若您是 LaTeX 的高手，歡迎至 \@ref(latex-cite-pkg) 給我一些指教。

<!--chapter:end:02-write-thesis.Rmd-->

<!--html_preserve--><script>
  addClassKlippyTo("pre.r, pre.markdown, pre.yaml, pre.latex");
  addKlippy('right', 'top', 'auto', '1', 'Copy code', 'Copied!');
</script><!--/html_preserve-->

# Bookdown Cheatsheet

## 數學 {#math}

完整內容，詳見 [Bookdown Ch. 2](https://bookdown.org/yihui/bookdown/markdown-extensions-by-bookdown.htm)

### Unnumbered Equations

```latex
\begin{equation*} 
\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x)
\end{equation*} 
```

產生：

\begin{equation*} 
\frac{d}{dx}\left( \int_{a}^{x} f(u)\,du\right)=f(x)
\end{equation*} 


### Numbered Equations
```latex
\begin{equation} 
  f\left(k\right) = \binom{n}{k} p^k\left(1-p\right)^{n-k}
  (\#eq:binom)
\end{equation} 
```

產生：

\begin{equation} 
  f\left(k\right) = \binom{n}{k} p^k\left(1-p\right)^{n-k}
  (\#eq:binom)
\end{equation} 

`式 \@ref(eq:binom)`產生：式 \@ref(eq:binom)


### Multi-line Aligned Equations

```latex
\begin{equation} 
\begin{split}
\mathrm{Var}(\hat{\beta}) & =\mathrm{Var}((X'X)^{-1}X'y)\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)((X'X)^{-1}X')'\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)X(X'X)^{-1}\\
 & =(X'X)^{-1}X'\sigma^{2}IX(X'X)^{-1}\\
 & =(X'X)^{-1}\sigma^{2}
\end{split}
(\#eq:var-beta)
\end{equation} 
```

產生：

\begin{equation} 
\begin{split}
\mathrm{Var}(\hat{\beta}) & =\mathrm{Var}((X'X)^{-1}X'y)\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)((X'X)^{-1}X')'\\
 & =(X'X)^{-1}X'\mathrm{Var}(y)X(X'X)^{-1}\\
 & =(X'X)^{-1}X'\sigma^{2}IX(X'X)^{-1}\\
 & =(X'X)^{-1}\sigma^{2}
\end{split}
(\#eq:var-beta)
\end{equation} 

`詳見公式 \@ref(eq:var-beta)`產生：詳見公式 \@ref(eq:var-beta)

### 定理與證明 {#theorem-proof}


    ```{theorem, thm-label, name="Pythagorean theorem"}
    For a right triangle, if $c$ denotes the length of the hypotenuse
    and $a$ and $b$ denote the lengths of the other two sides, we have
    
    $$a^2 + b^2 = c^2$$
    ```

產生：

\BeginKnitrBlock{theorem}\iffalse{-91-80-121-116-104-97-103-111-114-101-97-110-32-116-104-101-111-114-101-109-93-}\fi{}<div class="theorem"><span class="theorem" id="thm:pyth"><strong>(\#thm:pyth)  \iffalse (Pythagorean theorem) \fi{} </strong></span>For a right triangle, if $c$ denotes the length of the hypotenuse
and $a$ and $b$ denote the lengths of the other two sides, we have
$$a^2 + b^2 = c^2$$</div>\EndKnitrBlock{theorem}

`詳見定理 \@ref(thm:pyth)` 產生：詳見定理 \@ref(thm:pyth)

見其它[引用環境](https://bookdown.org/yihui/bookdown/markdown-extensions-by-bookdown.html#tab:theorem-envs)。

#### proof, remark, and solution

將 code chunk 中 `theorem` 換成 `proof`, `remark`, `solution`。這三者無法被 cross-reference。


- Benefits
- Quick Start
    - General Usage
        - Front matter
        - Content
    - Write Thesis in English (Write in Eng)
- Bookdown Demo
    a) Markdown quick guide
        - no closing or opening quotation marks
    a) Citation
    a) Cross References
    - 數學公式
    - indexing
- Harnessing the Power of R Community
    A) Facilitating Packages
        - citr
    A) 特定領域
        - linguisticsdown
- Resources
    - R Markdown Features
- Thanks and Help
    - GitHub issues

<!--chapter:end:03-bookdown-demo.Rmd-->

<!--html_preserve--><script>
  addClassKlippyTo("pre.r, pre.markdown, pre.yaml, pre.latex");
  addKlippy('right', 'top', 'auto', '1', 'Copy code', 'Copied!');
</script><!--/html_preserve-->

# 進階功能擴充 {#add-on}

透過其它 R 套件，R Markdown 的撰寫過程能夠更順暢。以下介紹幾個例子，歡迎補充說明。


## 語言學 {#ling}

語言學相關文件寫作時，常需要插入 IPA 語音符號，但鍵盤通常難以直接打出這些符號。為此，我寫了一個 R 套件，讓使用者能直接在 RStudio 中透過輸入語音 features 的方式打出 IPA：


\begin{center}\includegraphics[width=1\linewidth]{figs/ipa} \end{center}
<br>

要使用這功能，需安裝 `linguisticsdown`：
```r
install.packages("linguisticsdown")
```

並且在 `index.Rmd` 的 yaml 設定 IPA 符號專用的字型（需確認電腦上有安裝此字型）：
```yaml
ipa-font: 'Doulos SIL'
```

關於更詳細的功能，見[套件網頁](https://liao961120.github.io/linguisticsdown/)

<!--chapter:end:04-specific-extension.Rmd-->

<!--html_preserve--><script>
  addClassKlippyTo("pre.r, pre.markdown, pre.yaml, pre.latex");
  addKlippy('right', 'top', 'auto', '1', 'Copy code', 'Copied!');
</script><!--/html_preserve-->

\cleardoublepage

<!--
# 附錄 {-}


## LaTeX  文獻引用  {#latex-cite-pkg -}

-->

# (APPENDIX) 附錄 {-}

# LaTeX  文獻引用  {#latex-cite-pkg}

R Markdown 的 PDF 輸出是透過 Pandoc 的 LaTeX 模板，因此理論上 LaTeX 可以做到的事，也可以透過 R Markdown 達成。目前的問題是

> LaTeX 本身並未有支援繁體中文格式的文獻引用套件

經過一段時間的搜尋，發現 biblatex 套件似乎可以定義不同的引用格式[^biblatex]，因此，或許可以透過定義新的標點符號，例如將原本引用格式中的`,`定義成`，`、`.`定義成`。`，再透過 `.bib` 檔中的 `langid` field 辨識要使用何種引用格式。然而，由於作者本人對 LaTeX 並不熟悉，因此需要這方面高手的協助。


[^biblatex]: https://tex.stackexchange.com/questions/417762/different-styles-between-citations-and-bibliography  
https://tex.stackexchange.com/questions/377308/different-citation-styles-for-the-same-bibliography

<!--chapter:end:80-help.Rmd-->

\renewcommand{\href}{\oldhref}

# 參考資料 {- #references}

<!--chapter:end:99-references.Rmd-->

