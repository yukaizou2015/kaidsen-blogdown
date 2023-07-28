---
title: Get rid of row names
author: Yukai Zou
date: '2016-03-31'
slug: get-rid-of-row-names
categories:
  - R
tags:
  - base
---

Removing row names of a dataframe seems trivial but sometimes it is desired. To see how it works, consider the `mtcars` example:


```r
d1 <- mtcars
head(d1)
```

```
##                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

You can notice that row names are different from the rest of data in that there's no column name on top. We can simply assign `NULL` to it, indicating that it's _undefined_.


```r
# Assign NULL value to row ranems
row.names(d1) <- NULL
head(d1)
```

```
##    mpg cyl disp  hp drat    wt  qsec vs am gear carb
## 1 21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
## 2 21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
## 3 22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
## 4 21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
## 5 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
## 6 18.1   6  225 105 2.76 3.460 20.22  1  0    3    1
```

**Exercise:** What if assigning `NA` (Not Available) instead of `NULL`? The purpose here is to try to understand the two closely-related concepts.

**See also:** [The confusing names() and colnames()](/2016/04/05/the-confusing-names-and-colnames/index.html), [R-blogger post](https://www.r-bloggers.com/2018/07/r-null-values-null-na-nan-inf/)
