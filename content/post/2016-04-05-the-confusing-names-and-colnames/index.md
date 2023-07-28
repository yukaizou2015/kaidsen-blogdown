---
title: The confusing names() and colnames()
author: Yukai Zou
date: '2016-04-05'
slug: the-confusing-names-and-colnames
categories:
  - R
tags:
  - base
---

`colnames()` returns the column names for both `matrix` and `data.frame` datatypes;

To illustrake, taking the `iris` dataset as example:


```r
# To show that iris is a data.frame
class(iris)
```

```
## [1] "data.frame"
```

```r
colnames(iris)
```

```
## [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
```

```r
names(iris)
```

```
## [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"
```

`names()` only works for `data.frame` to return the column names; applying `names()` on `matrix` type would return `NULL`.


```r
# Convert the first four columns of iris into matrix
m1 <- as.matrix(iris[,1:4])
head(m1)
```

```
##      Sepal.Length Sepal.Width Petal.Length Petal.Width
## [1,]          5.1         3.5          1.4         0.2
## [2,]          4.9         3.0          1.4         0.2
## [3,]          4.7         3.2          1.3         0.2
## [4,]          4.6         3.1          1.5         0.2
## [5,]          5.0         3.6          1.4         0.2
## [6,]          5.4         3.9          1.7         0.4
```

```r
colnames(m1)
```

```
## [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"
```

```r
names(m1)
```

```
## NULL
```

Just some observations that worth keeping in mind.

**See also:** [Get rid of row names](/2016/03/31/get-rid-of-row-names/index.html)
