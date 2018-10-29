---
#ntu-template: 'phd' # phd, proposal
cjk-mainfont: 'AR PL KaitiM Big5'  # Default, 標楷體
en-mainfont: 'Liberation Serif'  # Default, Times New Roman
title-en: 'A Minimal NTU Thesis Bookdown Template'
title-zh: '臺灣大學論文 Bookdown 模板'
advisor-zh: |
  | 道約翰 \ \ 博士
  | \hspace{85pt} 林小明 \ \ 博士
## Second advisor needs to tweek hspace
advisor-en: |
  | Jonh Doe, PhD.
  | \hspace{60pt} Ming Lin, PhD.
## Second advisor needs to tweek hspace
author-en: 'Yongfu Liao'
author-zh: '廖永賦'
studentid: 'b04207003'
college-en: 'College of Science'
college-zh: '理學院'
year-ce: '2011'
year-mg: '100'
month-en: 'June'
month-num: '6'
day: '28'
doi: '10.1016/S0010-0277(00)00108-6'
institute-en: 'Department of Psychology'
institute-zh: '心理學系'
acknowledge-in-en: false     # if written in English, change to 'true'
acknowledgements: |
  非常感謝網路上各個默默耕耘開發 open source 專案的大大們。
  非常感謝網路上各個默默耕耘開發 open source 專案的大大們。
  非常感謝網路上各個默默耕耘開發 open source 專案的大大們。
  
  沒有這些既存的資源，這份模板是不可能出現的。沒有這些既存的資源，這份模板是不可能出現的。沒有這些既存的資源，這份模板是不可能出現的。沒有這些既存的資源，這份模板是不可能出現的。
abstract-en: |
  The first line of the abstract starts on **line 5** and must not be blank. The first line of the abstract starts on **line 5** and must not be blank. The first line of the abstract starts on **line 5** and must not be blank.
  
  A new paragraph of the abstract. A new paragraph of the abstract. A new paragraph of the abstract. A new paragraph of the abstract. A new paragraph of the abstract. A new paragraph of the abstract.
  
abstract-zh: |
  摘要**第 5 行**開始而且不能是空行。摘要**第 5 行**開始而且不能是空行。摘要**第 5 行**開始而且不能是空行。摘要**第 5 行**開始而且不能是空行。
  
  新段落要在前面空一行。新段落要在前面空一行。新段落要在前面空一行。新段落要在前面空一行。新段落要在前面空一行。
keyword-en: |
  Line 2, R Markdown, Bookdown, Reproducible Research
keyword-zh: |
  第二行開始、R Markdown、Bookdown、可重製研究
link-citations: yes
site: bookdown::bookdown_site
output:
  bookdown::pdf_document2:
    latex_engine: xelatex
    number_sections: FALSE
    toc: False
    template: template-rewrite.tex
    keep_tex: true
---
