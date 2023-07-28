---
title: Customize factor level
author: Yukai Zou
date: '2017-06-04'
slug: customize-factor-level
categories:
  - R
tags:
  - dplyr
---

To do so, specify the `levels` attribute with a vector.

Working example:


```r
dat <- factor(c("A", "B", "C"))
dat
```

```
## [1] A B C
## Levels: A B C
```

```r
dat2 <- factor(dat, levels = c("C", "B", "A"))
dat2
```

```
## [1] A B C
## Levels: C B A
```

