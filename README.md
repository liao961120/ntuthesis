# NTUbookdown

這是國立臺灣大學的論文模板，
基於 [bookdown](https://github.com/rstudio/bookdown) 的架構。

輸出範例，請見：

- [中文 PDF](https://liao961120.github.io/NTUbookdown/ntu-bookdown.pdf)
- [英文 PDF](https://liao961120.github.io/NTUbookdown/ntu-bookdown-en.pdf)
- [GitBook](https://liao961120.github.io/NTUbookdown/)


## 使用

### 封面製作

開啟 `front_matter/front_matter.rmd`，修改其內的 `yaml` 後 knit 成 PDF<sup>1</sup>。
論文 (PDF檔) 的詳細資訊，如中英文標題、姓名、指導老師等，皆在此設定。

### 內文編輯

這個模板是直接使用 bookdown 預設載入的模板。關於 bookdown 的使用，詳見[此](https://bookdown.org/yihui/bookdown/)。

目前論文預設的語言是中文，論文的內容：

- 第一章寫在 `01-xxx.Rmd`
- 第二章寫在 `02-xxx.Rmd`，依此類推
- `06-references.Rmd` 原則上不須動它

- `index.Rmd`：yaml 僅需設定下列幾項

```markdown
title: '臺灣大學論文 Bookdown 模板'     # 顯示在 GitBook 的標題
author: 'Yongfu Liao'                 # 顯示在 GitBook 的作者
linestretch: 1.5 # If English: 1.5    # PDF 行距
watermark: false                      # PDF 是否印出浮水印
bibliography: packages.bib            # 論文的參考書目
```

## To Do

1. Global line height in specific parts
    - [itemize](https://tex.stackexchange.com/questions/16793/global-setting-of-spacing-between-items-in-itemize-environment-for-beamer/249958)
    - Code shade area
1. 整理成 R Package
1. 使用說明


## 附註

[1]: 這個 LaTeX 的模板是根據 [tzhuan/ntu-thesis](https://github.com/tzhuan/ntu-thesis) 修改而成，非常感謝大大。
