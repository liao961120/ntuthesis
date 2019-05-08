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

並請閱讀[第一版的說明文件](https://liao961120.github.io/ntuthesis/doc-v1)。

### 最新版本 (`v2.0.0`)

```r
#install.packages('remotes')
remotes::install_github("liao961120/ntuthesis")
```

安裝完成後，執行下方指令，下載套件所需的字體檔：
```
ntuthesis::download_fonts()
```

新版的 `ntuthesis` 較易加入其它學校模板，目前正在開發中，API 與舊版兼容，但舊的 `ntu_bookdown` 模板已更新為 `ntu`，並且不容於新版。已使用 `ntu_bookdown` 模板者，請下載 `v1.0.0`。


#### `v2.0.0` 相較 `v1.0.0`

若無特殊需求，建議使用最新版本，`v1.0.0` 有一些格式上的問題。

`v2.0.0` 新增與改進了以下功能：

- 解決跨作業系統的字型問題
    
    使用者不需額外設定字型，PDF 輸出字型預設為「標楷體」(中文) 與「Times New Roman」(英文)，並且[支援 IPA 語音符號](https://liao961120.github.io/ntuthesis/doc/add-on.html)

- 修正字體大小
    
    `v1.0.0` 的字體大小為錯誤的 (非 12pt)，此版本修正為 12pt。

- 改進英文 PDF 輸出格式：頂層標題置中




## 使用

關於詳細的使用說明，見[套件網頁](https://liao961120.github.io/ntuthesis/doc)。


## 問題

若有套件使用上的問題，可在 [GitHub](https://github.com/liao961120/ntuthesis/issues) 回報。若沒有 GitHub 帳號，可透過 [Email](mailto:liao961120@gmail.com) 聯絡 [Yongfu Liao](https://liao961120.github.io)。


## 其它

關於此套件的部落格[文章](https://liao961120.github.io/2019/03/07/ntuthesis.html)

## 特別感謝

臺大論文模板的封面是根據 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis) 修改而成。

