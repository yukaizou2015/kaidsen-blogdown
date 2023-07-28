---
title: About spread() in tidyr
author: Yukai Zou
date: '2016-09-13'
slug: about-spread-in-tidyr
categories:
  - R
tags:
  - tidyr
---


**Update**: now we have `pivot_wider()` which works effectively the same. Check it out [here](https://tidyr.tidyverse.org/reference/pivot_wider.html).

`spread()` can reshape dataset containing measures of multiple time points and help query data availability per subject, which can truly be a time saver when there are many subjects with lots of data. 

- `spread(data, key, value)`

Now, consider the following (minimal) dataset that has 3 subjects and measures from 3 time points: 


```
##   Subject Timepoint Measure
## 1       A        T1      10
## 2       A        T2      12
## 3       A        T3      NA
## 4       B        T1       9
## 5       B        T2      10
## 6       B        T3       9
## 7       C        T1       6
## 8       C        T2      NA
## 9       C        T3      NA
```
Unless reading line by line, it's not immediate to tell whether the measure at a certain timepoint is missing or not. It gets even more cumbersome when the list is long. What if say we transform the table to let the `Timepoint` becomes separate columns, and the values within `Measure` are stored within those columns instead? This is where `spread()` can be applied:


```r
dat %>% spread(key = Timepoint, value = Measure)
```

```
##   Subject T1 T2 T3
## 1       A 10 12 NA
## 2       B  9 10  9
## 3       C  6 NA NA
```
It gets easier to read along each row to grasp the idea of data availability, plus the dataset [becomes much more tidy](https://vita.had.co.nz/papers/tidy-data.pdf).
