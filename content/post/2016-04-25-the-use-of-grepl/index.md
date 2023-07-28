---
title: The use of grepl()
author: Yukai Zou
date: '2016-04-25'
slug: the-use-of-grepl
categories:
  - R
tags:
  - base
---



Different from `grep()` which outputs the _indices_ of the matched pattern, `grepl()` returns logical `TRUE/FALSE` values.

We look at the `cyl` variable in mtcars sets as example:


```r
mtcars$cyl
```

```
##  [1] 6 6 4 6 8 6 8 4 4 6 6 8 8 8 8 8 8 4 4 4 4 8 8 8 8 4 4 4 8 6 8 4
```

To find out what entries are 6-cylinder engines, `grep()` will return the indices of the vector (and omit the rest):


```r
grep(6, mtcars$cyl)
```

```
## [1]  1  2  4  6 10 11 30
```

whereas `grepl()` will return logical values for the entire vector.


```r
grepl(6, mtcars$cyl)
```

```
##  [1]  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE
## [13] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
## [25] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
```

The outputs vary in terms of the datatypes and lengths, which can be useful to serve difference processing scenarios.
