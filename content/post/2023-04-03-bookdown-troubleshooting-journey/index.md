---
title: '{bookdown} troubleshooting journey'
author: Yukai Zou
date: '2023-04-03'
slug: bookdown-troubleshooting-journey
categories:
  - R
tags:
  - bookdown
---

# Motivation

I should take action on developing my route 2 training package. I want to use R bookdown to build the pdf for my portfolio. 

# Setting up LaTex on MacOS

To get the demo pdf in the [get-started tutorial](https://bookdown.org/yihui/bookdown/get-started.html), I need to set up LaTex on my Macbook.

I followed the instruction [here](https://daniel.feldroy.com/posts/setting-up-latex-on-mac-os-x).

At Step 1, I found that mactex-basic.pkg is too old. I followed instruction [here](https://www.tug.org/mactex/morepackages.html) to install `BasicTex.pkg`, a lightweight distribution of `MacTex.pkg` which is a very large package.

After installing BasicTex, I can run `tex` and `tlmgr` in Terminal.

**Note:** For Windows, Tex Live can be downloaded and installed [here](https://tug.org/texlive/windows.html).

Now I go back to RStudio and test if can build the book now.

```
! LaTeX Error: File `framed.sty' not found.

! Emergency stop.
<read *> 

Error: LaTeX failed to compile bookdown-demo.tex. See https://yihui.org/tinytex/r/#debugging for debugging tips. See bookdown-demo.log for more info.
Execution halted
Error: bookdown::render_book() failed to render the output format 'bookdown::pdf_book'.
Execution halted
```

I now run `tinytex::tlmgr_update()` but it needs to be run as sudo. In terminal I ran:


```base
sudo tlmgr update --all --self
```

And all done. Try build the book again led to failure. I looked back at https://yihui.org/tinytex/r/#debugging, where it suggested turning on `options(tinytex.verbose = TRUE)` in R Markdown file.

There was a new file `bookdown-demo.log` generated. Reading the file pointing me to this error message:

```
! LaTeX Error: File 'framed.sty' not found.
```

So, I looked up and found an answer on Github [here](https://github.com/rstudio/rmarkdown/issues/39#issuecomment-39022607), where it suggested that I need to install the framed package by running:


```base
sudo tlmgr install framed
```

Rebuilding the book, and this time I got this error:

```
Error: Must install the following packages to use bs4_book():
* downlit
```

After running `install.packages("downlit")`, I rebuild the book and it was successful!!
By the end of today (2 Apr), I had a working draft and inserted all the competencies as tables. This allows me to prepare for the probation meeting on Monday with Angela, before the meeting I will go as Mobeen suggested, to think how to relate activities and identify gaps.

## Ignoring space in variable names in {bookdown}

In read.csv(), set `check.names = FALSE` allows keeping the variable names, which is helpful in `{bookdown}` to generate PDF tables with column names containing spaces as expected.

## Avoid rendering comma into separate columns

In csv files, wrapping comma with double quotes avoid rendering into separate columns. Then I can focus on generating csv of competencies.

**See also:** [post on Stack Overflow](https://stackoverflow.com/questions/6124519/r-import-csv-with-column-names-that-contain-spaces)

## Column spec in knitr::kable()

kable_styling(full_width = F) %>%
column_spec(2, width = "30em")

But I cannot use this functions because my Latex lacks file `multirow.sty`. I found a Stack Overflow page [here](https://tex.stackexchange.com/questions/298794/latex-error-file-multirow-sty-not-found) which suggested that I need to install `texlive-latex-extra`.

So, I need to install [MacPort](https://www.macports.org/index.php) to run `port` command, and then to run this command:

```
sudo port install texlive-latex-extra
```

I gave up this route as it gave me more lower-level errors. Instead, I tried another answer from the same StackOverflow post:

```
tlmgr install collection-latexextra
```

And problem solved! multirow.sty is added. Now I can fine-tune the second and third columns.

**See also:** [Create Awesome LaTeX Table with knitr::kable and kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_pdf.pdf)
