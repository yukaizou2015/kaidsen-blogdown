---
title: Convert table to matrix
author: Yukai Zou
date: '2018-05-24'
slug: convert-table-to-matrix
categories:
  - R
tags:
  - R
---

To do so, use the `unclass()` function.


```r
tab <- with(airquality, table(OzHi = Ozone > 80, Month, useNA = "ifany"))
class(tab)
```

```
## [1] "table"
```

```r
unclass(tab)
```

```
##        Month
## OzHi     5  6  7  8  9
##   FALSE 25  9 20 19 27
##   TRUE   1  0  6  7  2
##   <NA>   5 21  5  5  1
```

