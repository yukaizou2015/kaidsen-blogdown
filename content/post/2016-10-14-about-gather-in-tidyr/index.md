---
title: About gather() in tidyr
author: Yukai Zou
date: '2016-10-14'
slug: about-gather-in-tidyr
categories:
  - R
tags:
  - tidyr
---



**Update**: `gather()` is no longer maintained and it is recommended that `pivot_longer()` is used. For details, see [here](https://tidyr.tidyverse.org/reference/gather.html).

The `gather()` function is somewhat complementary to what the `spread()` function does.

- `gather(data, key, value, -variable)`

where `-` stands for "exclude", meaning that `variable` is excluded in this case.

Working example:


```r
stocks <- tibble(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)

stocks
```

```
## # A tibble: 10 × 4
##    time             X      Y      Z
##    <date>       <dbl>  <dbl>  <dbl>
##  1 2009-01-01  0.208   1.14  -1.67 
##  2 2009-01-02  2.40    1.74  -1.14 
##  3 2009-01-03 -0.424   2.01  -1.03 
##  4 2009-01-04  0.0343 -0.978  3.50 
##  5 2009-01-05  0.814   0.280 -2.14 
##  6 2009-01-06 -0.361  -0.404 -1.57 
##  7 2009-01-07 -1.59    0.649  1.90 
##  8 2009-01-08 -1.15    3.25   4.10 
##  9 2009-01-09 -1.20   -0.818  4.01 
## 10 2009-01-10  2.23    2.25   0.777
```

In this table, to put the variables (X, Y, and Z) into a new variable "stock", and al the values to a new variable "price", it can be achieved via below:


```r
gather(stocks, key = "stock", value = "price", -time)
```

```
## # A tibble: 30 × 3
##    time       stock   price
##    <date>     <chr>   <dbl>
##  1 2009-01-01 X      0.208 
##  2 2009-01-02 X      2.40  
##  3 2009-01-03 X     -0.424 
##  4 2009-01-04 X      0.0343
##  5 2009-01-05 X      0.814 
##  6 2009-01-06 X     -0.361 
##  7 2009-01-07 X     -1.59  
##  8 2009-01-08 X     -1.15  
##  9 2009-01-09 X     -1.20  
## 10 2009-01-10 X      2.23  
## # … with 20 more rows
```
