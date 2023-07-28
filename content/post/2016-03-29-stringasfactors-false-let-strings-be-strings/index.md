---
title: '"stringAsFactors = FALSE": Let strings be strings'
author: Yukai Zou
date: '2016-03-29'
slug: stringasfactors-false-let-strings-be-strings
categories:
  - R
tags:
  - base
---

**Update:** Since `R 4.0.0`, the default for `stringAsFactors` has been set to `FALSE`. It's a good idea to be explicit, so that the code can run more robustly across different R versions.

One of the default behaviors in older versions of R, which is sometimes too aggressive, is converting strings to a datatype called `factor`.


```r
t1 <- data.frame(label = rep(c("A", "B"), 5), stringsAsFactors = TRUE)
t1$label
```

```
##  [1] A B A B A B A B A B
## Levels: A B
```

If a new string value is entered:


```r
t1$label[1] <- "C"
```

```
## Warning in `[<-.factor`(`*tmp*`, 1, value = structure(c(NA, 2L, 1L, 2L, :
## invalid factor level, NA generated
```

R won't recognize the string and instead generated a missing value. To resolve this issue: 


```r
t2 <- data.frame(label = rep(c("A", "B"), 5), stringsAsFactors = FALSE)
t2
```

```
##    label
## 1      A
## 2      B
## 3      A
## 4      B
## 5      A
## 6      B
## 7      A
## 8      B
## 9      A
## 10     B
```

```r
t2$label[1] <- "C"
t2
```

```
##    label
## 1      C
## 2      B
## 3      A
## 4      B
## 5      A
## 6      B
## 7      A
## 8      B
## 9      A
## 10     B
```
The column can be transformed into `factor` later if necessary:


```r
t2 <- transform(t2, label2 = factor(label))
t2$label2
```

```
##  [1] C B A B A B A B A B
## Levels: A B C
```

**See also:** [R-blogger post](https://www.r-bloggers.com/2018/03/r-tip-use-stringsasfactors-false/)
