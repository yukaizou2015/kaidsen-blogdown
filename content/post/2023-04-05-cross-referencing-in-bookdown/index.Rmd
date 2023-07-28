---
title: Cross referencing in {bookdown}
author: Yukai Zou
date: '2023-04-05'
slug: cross-referencing-in-bookdown
categories:
  - R
tags:
  - bookdown
---

# Inline cross referencing

One can quickly cross-reference section or chapter using the `\@ref()` syntax.

Working example:

- Section `\@ref(label)`

**Note:** Make sure to use parenthesis `()` instead of curly bracket `{}` which is used in LaTeX.

# Import from csv

It's important to note that when imported through csv file, this syntax will be converted to \textbackslash{} in tex and therefore not rendered as expected when converting to pdf. Additional step of cleaning is needed which currently through Overleaf.

**See also:** [Bookdown cheat sheet](https://happygitwithr.com/bookdown-cheat-sheet.html)
