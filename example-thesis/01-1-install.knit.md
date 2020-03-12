<!--html_preserve--><script>
  addClassKlippyToPreCode();
  addClassKlippyTo("pre.r, pre.markdown");
  addKlippy('right', 'top', 'auto', '1', 'Copy code', 'Copied!');
</script><!--/html_preserve-->

# 安裝 {#install} 

### `v1.0.0` {-}

2019-02-10 之前已使用 `ntuthesis` 撰寫論文者，請下載 `v1.0.0`：
```r
#install.packages('remotes')
remotes::install_github("liao961120/ntuthesis@v1.0.0")
```

並請閱讀[第一版的說明文件](https://liao961120.github.io/ntuthesis/doc-v1)。

### 最新版 {-}
```r
#install.packages('remotes')
remotes::install_github("liao961120/ntuthesis")
```

安裝完成後，執行下方指令，下載套件所需的字體檔：
```
ntuthesis::download_fonts()
```

新版的 `ntuthesis` 較易加入其它學校模板，目前正在開發中，API 與舊版兼容，但舊的 `ntu_bookdown` 模板已更新為 `ntu`，並且不容於新版。已使用 `ntu_bookdown` 模板者，請下載 `v1.0.0`。


## IDE

建議使用 Rstudio，因為安裝 Rstudio 時，同時會安裝 Pandoc。若使用者使用 Rstudio 以外的 IDE，需要自行安裝並設定 Pandoc PATH，對使用者較為麻煩。


## LaTeX

若已有管理、安裝 LaTeX 套件經驗者，可忽略。

### tinytex 套件

若電腦尚未安裝 LaTeX，可安裝 R 的 tinytex 套件 (Mac 使用者可能會安裝失敗，見下文)：

```r
install.packages('tinytex')
```

接著，選擇**與電腦相同作業系統**的連結下載 TinyTeX Library[^portable]：

- [Linux x86_64](http://bit.ly/TinyTex-linux)
- [Windows 7/10 64bit](http://bit.ly/TinyTeX-win)
- Mac 使用者在安裝 TinyTeX Library 時**很可能會遇到問題**。請跳過下方內容，直接從 \@ref(mac) 節開始閱讀，幸運的話可以直接安裝成功。若失敗的話，可參考此二連結中的對話串：[tinytex installation pain on Mac](https://github.com/yihui/tinytex/issues/92) 與 [/usr/local/bin not writable](https://github.com/yihui/tinytex/issues/24)。

下載檔案後，

a) 將檔案解壓縮[^decompress]

a) 將解壓後資料夾中的 `.TinyTeX/`[^wintiny] 放至喜歡的路徑（e.g. `C:\Users\<username>\.TinyTeX`, 路徑儘量簡單且**不能包含中文字**）

a) 接著在 R 中執行：
```r
tinytex::use_tinytex()
```
即會跳出一個視窗。請選擇剛剛存放 `.TinyTeX/` 的路徑。


若失敗詳見[此篇文章](https://yihui.name/en/2018/08/tinytex-flash-drive)。



#### LaTeX 套件管理 {#tinytex-manage}

在輸出 R Markdown 時，tinytex 會自動安裝缺少的 LaTeX 套件。因此，使用 TinyTeX 可以減輕管理 LaTeX 套件的麻煩。然而，下載 LaTeX 套件需要許多時間，因此這裡提供預先下載好之 TinyTeX（Windows 和 Linux）。

##### Mac {#mac}

由於作者沒有 Mac 電腦，無法提供 Mac 版本的 TinyTeX，Mac 使用者需使用
```r
tinytex::install_tinytex()
```
安裝 TinyTeX，之後電腦在[輸出論文](#export-thesis)時，會自動安裝所需的套件。

(若安裝失敗，請看看是否錯誤訊息與此二討論串中類似：[tinytex installation pain on Mac](https://github.com/yihui/tinytex/issues/92)、[/usr/local/bin not writable](https://github.com/yihui/tinytex/issues/24))

這會使得第一次輸出論文時會花費較多時間，然而，若願意的話，您可以將下載到您電腦上的 TinyTeX 提供給其他 Mac 使用者：

成功輸出論文 PDF 後，執行
```r
tinytex::copy_tinytex()
```
即會跳出一個新視窗。選擇資料夾後，即會將電腦上的 TinyTeX 複製到此資料夾。如此，下一位使用者只須將此資料夾複製到電腦上，並用 `tinytex::use_tinytex()` 設定 TinyTeX 的路徑至該資料夾，即可節省輸出論文時安裝 LaTeX 套件所耗費的時間。
希望使用 Mac 成功輸出論文的使用者能將 TinyTeX 的壓縮檔或連結提供給我，讓其他的使用者受益。


[^wintiny]: 在 Windows 上是 `TinyTeX/`

[^decompress]: Linux 使用者可用 `tar -zxvf tinytex-linux.tar.gz` 指令解壓縮。Windows 使用者可用 [7-Zip](https://www.developershome.com/7-zip/) 解壓縮。

[^portable]: 根據 Yihui 的說明 (https://yihui.name/en/2018/08/tinytex-flash-drive)，TinyTex 具有可攜式（portable）的特性。
