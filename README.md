[![Build Status](https://travis-ci.org/liao961120/ntuthesis.svg?branch=master)](https://travis-ci.org/liao961120/ntuthesis) [![Support R Version](https://img.shields.io/badge/R-≥%203.4.0-blue.svg)](https://cran.r-project.org/) [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://www.gnu.org/licenses/gpl-3.0)

# ntuthesis

這是國立臺灣大學的論文模板，基於 [bookdown](https://github.com/rstudio/bookdown) 的架構。為了方便使用，將此模板打包成 R Package，方便使用者下載及使用內建函數。

輸出範例：

- [中文 PDF](https://liao961120.github.io/ntuthesis/doc/ntu-bookdown.pdf)
- [英文 PDF](https://liao961120.github.io/ntuthesis/doc/ntu-bookdown-en.pdf)


此套件亦可用於他校論文的撰寫，詳見 [建立他校模板](https://liao961120.github.io/ntuthesis/articles/extend_template.html)。

## 安裝

### `v1.0.0`

2019-02-10 之前已使用 `ntuthesis` 撰寫論文者，請下載 `v1.0.0`：
```r
#install.packages('remotes')
remotes::install_github("liao961120/ntuthesis@v1.0.0")
```

### 最新版
```r
#install.packages('remotes')
remotes::install_github("liao961120/ntuthesis")
```

新版的 `ntuthesis` 能加入其它學校的模板。目前正在開發中，API 與舊版兼容，但舊的 `ntu_bookdown` 模板已更新為 `ntu`，並且不容於新版。已使用 `ntu_bookdown` 模板者，請下載 `v1.0.0`。

## 使用

關於詳細的使用說明，見[套件網頁](https://liao961120.github.io/ntuthesis/doc)。


## 問題

若有套件使用上的問題，可在 [GitHub](https://github.com/liao961120/ntuthesis/issues) 回報。若沒有 GitHub 帳號，可透過 [Email](mailto:liao961120@gmail.com) 聯絡 [Yongfu Liao](https://liao961120.github.io)。


## 其它

關於此套件的部落格[文章](https://liao961120.github.io/2019/03/07/ntuthesis.html)

## 特別感謝

臺大論文模板的封面是根據 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis) 修改而成。

