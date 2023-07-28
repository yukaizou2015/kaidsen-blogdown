---
title: Convert p-values using stars.pvals() and cut()
author: Yukai Zou
date: '2016-03-25'
slug: convert-p-values-using-stars-pvals-and-cut
categories:
  - R
tags:
  - gtools
  - base
---



Consider the scenario where we run some statistical analyses using R. We get a bunch of p-values, and we need to highlight those that are significant, so they don't all look the same. There are two functions that could help automate this tedious task.

# stars.pval()

`stars.pval()` from `{gtools}` package can convert p-values to stars.

Let's simulate some p-values:


```r
x <- seq(from = 0.001, to = 0.1, by = 0.005)
x
```

```
##  [1] 0.001 0.006 0.011 0.016 0.021 0.026 0.031 0.036 0.041 0.046 0.051 0.056
## [13] 0.061 0.066 0.071 0.076 0.081 0.086 0.091 0.096
```

and apply `stars.pval()`:


```r
stars.pval(x)
```

```
##  [1] "***" "**"  "*"   "*"   "*"   "*"   "*"   "*"   "*"   "*"   "."   "."  
## [13] "."   "."   "."   "."   "."   "."   "."   "."  
## attr(,"legend")
## [1] "0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1"
```

The output also returns the legends, which is a nice feature that explains what p-value ranges are mapped to what symbols.

# cut()

The `cut()` function can divide numbers into several sections, which could act as an extension to `star.pvals()` who just converts p-values to stars. 

- By specifying the `break` attribute, the numeric vector can be divided either evenly or according to what's defined in the vector.

Working example:

Consider the same simulated vector above:


```
##  [1] 0.001 0.006 0.011 0.016 0.021 0.026 0.031 0.036 0.041 0.046 0.051 0.056
## [13] 0.061 0.066 0.071 0.076 0.081 0.086 0.091 0.096
```

To break this vector evenly into 10 subsets (bins):


```r
cut(x, breaks = 10)
```

```
##  [1] (0.000905,0.0105] (0.000905,0.0105] (0.0105,0.02]     (0.0105,0.02]    
##  [5] (0.02,0.0295]     (0.02,0.0295]     (0.0295,0.039]    (0.0295,0.039]   
##  [9] (0.039,0.0485]    (0.039,0.0485]    (0.0485,0.058]    (0.0485,0.058]   
## [13] (0.058,0.0675]    (0.058,0.0675]    (0.0675,0.077]    (0.0675,0.077]   
## [17] (0.077,0.0865]    (0.077,0.0865]    (0.0865,0.0961]   (0.0865,0.0961]  
## 10 Levels: (0.000905,0.0105] (0.0105,0.02] (0.02,0.0295] ... (0.0865,0.0961]
```
Note that the output is a _factor_ datatype that comes with 10 levels.

To cut the vectors according to p-value ranges:


```r
cut(x, breaks = c(0, 0.001, 0.01, 0.05, 1))
```

```
##  [1] (0,0.001]    (0.001,0.01] (0.01,0.05]  (0.01,0.05]  (0.01,0.05] 
##  [6] (0.01,0.05]  (0.01,0.05]  (0.01,0.05]  (0.01,0.05]  (0.01,0.05] 
## [11] (0.05,1]     (0.05,1]     (0.05,1]     (0.05,1]     (0.05,1]    
## [16] (0.05,1]     (0.05,1]     (0.05,1]     (0.05,1]     (0.05,1]    
## Levels: (0,0.001] (0.001,0.01] (0.01,0.05] (0.05,1]
```
Putting all the outputs to a data frame:


```r
data.frame(pval = x,
           cut.pval = cut(x, breaks = c(0, 0.001, 0.01, 0.05, 1)),
           stars.pval = stars.pval(x))
```

```
##     pval     cut.pval stars.pval
## 1  0.001    (0,0.001]        ***
## 2  0.006 (0.001,0.01]         **
## 3  0.011  (0.01,0.05]          *
## 4  0.016  (0.01,0.05]          *
## 5  0.021  (0.01,0.05]          *
## 6  0.026  (0.01,0.05]          *
## 7  0.031  (0.01,0.05]          *
## 8  0.036  (0.01,0.05]          *
## 9  0.041  (0.01,0.05]          *
## 10 0.046  (0.01,0.05]          *
## 11 0.051     (0.05,1]          .
## 12 0.056     (0.05,1]          .
## 13 0.061     (0.05,1]          .
## 14 0.066     (0.05,1]          .
## 15 0.071     (0.05,1]          .
## 16 0.076     (0.05,1]          .
## 17 0.081     (0.05,1]          .
## 18 0.086     (0.05,1]          .
## 19 0.091     (0.05,1]          .
## 20 0.096     (0.05,1]          .
```
