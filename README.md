[![Build Status](https://travis-ci.org/liao961120/ntuthesis.svg?branch=master)](https://travis-ci.org/liao961120/ntuthesis)

# ntuthesis

這是國立臺灣大學的論文模板，
基於 [bookdown](https://github.com/rstudio/bookdown) 的架構。
為了方便使用，這個模板將被製作成 R Package，方便使用者下載及使用內建函數。


輸出範例，請見：

- [中文 PDF](https://liao961120.github.io/ntuthesis/ntu-bookdown.pdf)
- [英文 PDF](https://liao961120.github.io/ntuthesis/ntu-bookdown-en.pdf)
- [GitBook](https://liao961120.github.io/ntuthesis/)


## 需求軟體

若曾經用 R Markdown 輸出 PDF 中文文件，則可忽略下方。

電腦尚未安裝 LaTeX 軟體，可以

- 直接安裝 [tinytex](https://yihui.name/tinytex/) R 套件
- 或安裝 LaTeX 軟體
    - Windows: MiKTeX
    - Linux: TeX Live

## 安裝
```r
devtools::install_github("liao961120/ntuthesis")
```

## 使用

開啟 RStudio，選取左上方 `File` > `New File` > `R Markdown`，
即會出現以下畫面：

![](https://raw.githubusercontent.com/liao961120/ntuthesis/master/img/rmd-template.png)

1. 選取左方`From Template`
2. 找到`Thesis Template for NTU`
3. 在下方`Name:`寫下創建的資料夾名稱

接著需要將該資料夾變更為 bookdown 專案。這可以用 RStudio 左上方 `File` > `New Project` > `Existing Directory` 達成，或直接使用下方指令：

```r
library(ntuthesis)
init_proj(dir = ".")))  # init working dir as proj.
```

### 輸出論文

在`person-info.yml`輸入個人資料後，執行以下指令即會生成封面：
```r
comp_front()
```


接著用下方指令或 RStudio Environment Pane 裡的 `Build Book` 輸出論文：
```r
bookdown::render_book("index.Rmd", "bookdown::gitbook")
bookdown::render_book("index.Rmd", "bookdown::bookdown::pdf_book")
```

![](https://raw.githubusercontent.com/liao961120/ntuthesis/master/img/build-button.png)

### 內文編輯

這個模板是使用 [bookdown](https://bookdown.org/yihui/bookdown/) 製作，因此所有 bookdown 的功能都可直接使用。

目前論文預設的語言是中文，論文的內容：

- 第一章寫在 `01-xxx.Rmd`
- 第二章寫在 `02-xxx.Rmd`，依此類推
- `99-references.Rmd` 原則上不須動它

- `index.Rmd`：yaml 僅需設定下列幾項

```markdown
title: '臺灣大學論文 Bookdown 模板'     # 顯示在 GitBook 的標題
author: 'Yongfu Liao'                 # 顯示在 GitBook 的作者
linestretch: 1.5 # If English: 1.5    # PDF 行距
watermark: false                      # PDF 是否印出浮水印
bibliography: ref.bib            # 論文的參考書目
```

## To Do

1. [bookdown define LaTeX](https://bookdown.org/yihui/bookdown/publishers.html)
1. self-defined chunks?
1. test biblatex
1. 整理成 R Package
1. 使用說明
    - [R Markdown ordered list](https://stackoverflow.com/a/52539925)
    - [Bookdown cheatsheet](www.pzhao.org/en/post/bookdown-cheatsheet/)
    - [Bookdown Contest](https://blog.rstudio.com/2018/07/27/first-bookdown-contest/)

## 附註

[1]: 這個 LaTeX 的模板是根據 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis) 修改而成，非常感謝大大。
