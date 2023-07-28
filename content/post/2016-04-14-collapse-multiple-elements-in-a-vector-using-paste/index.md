---
title: Collapse multiple elements in a vector using paste()
author: Yukai Zou
date: '2016-04-14'
slug: collapse-multiple-elements-in-a-vector-using-paste
categories:
  - R
tags:
  - base
---

To do so, specify the `collapse` attribute in `paste()` function:

- `paste(..., collapse = "")`

Collapsing elements can be quite useful, not only for text processing and cleaning purposes, but also filtering a dataset to narrow it down to observations that are of interest. Of course, there are a ton of tools out there to achieve this (e.g. `dplyr::filter`) but to me it's more natural sometimes to just _write out_ what I want to look at in a string vector first. I'll explain with an example.

Consider the classic `mtcars` dataset:


```
##                    mpg cyl  disp  hp drat    wt  qsec vs am gear carb
## Mazda RX4         21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
## Mazda RX4 Wag     21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
## Datsun 710        22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
## Hornet 4 Drive    21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
## Hornet Sportabout 18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
## Valiant           18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
## Duster 360        14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
## Merc 240D         24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
## Merc 230          22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
## Merc 280          19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
```
There are many models here, and in fact I only need to look at `Mazda RX4` and `Valiant`. 


```r
# Code "Mazda RX4" and "Valiant" in a string vector
string_model <- c("^Mazda RX4$", "Valiant")

# Collapse the two elements into one
string_model_collapse <- paste(string_model, collapse = "|")
string_model_collapse
```

```
## [1] "^Mazda RX4$|Valiant"
```

Note that `^` and `$` were used to define boundary at the start and the end, so that only "Mazda RX4" will be grabbed and not "Mazda RX4 Wag". See [this blog](/2017/06/17/notes-on-string-editing/index.html#add-boundary) for details. 

Now I have a single-element string vector, Next is to plug the new vector into the `grep()` function:


```r
id_model_of_interest <- grep(string_model_collapse, row.names(mtcars))
id_model_of_interest
```

```
## [1] 1 6
```
Note that the model names are not stored in any column, which needs to be retrived using `row.names()` function.


```r
mtcars[id_model_of_interest,]
```

```
##            mpg cyl disp  hp drat   wt  qsec vs am gear carb
## Mazda RX4 21.0   6  160 110 3.90 2.62 16.46  0  1    4    4
## Valiant   18.1   6  225 105 2.76 3.46 20.22  1  0    3    1
```

