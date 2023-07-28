---
title: Replace pattern using gsub()
author: Yukai Zou
date: '2016-03-07'
slug: replace-pattern-using-gsub
categories:
  - R
tags:
  - base
---

`gsub()` can find and replace pattern in a vector or a data frame.

Working example:


```r
x <- c("abcdefghabc", "abcde")

gsub("abc", "ABC", x)
```

```
## [1] "ABCdefghABC" "ABCde"
```

Note that the `abc` pattern appeared twice in the first element and both have been replaced with `ABC`. To do a little comparison here with a very similar function `sub()`:


```r
sub("abc", "ABC", x)
```

```
## [1] "ABCdefghabc" "ABCde"
```

We can see that although `sub()` can apply on a vector, only the first occurrence of the pattern was replaced.
