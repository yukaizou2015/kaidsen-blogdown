---
title: 'More on color scales: {grDevices} and {RColorBrewer}'
author: Yukai Zou
date: '2016-04-20'
slug: more-on-color-scales-grdevices-and-rcolorbrewer
categories:
  - R
tags:
  - plot
  - grDevice
---

# grDevices

The `colorRamp()` and `colorRampPalette()` functions in `{grDevice}` package allow generating gradient colors that can be used in creating color scales.

Working examples:


```r
library(grDevices)

colorRamp(c("red", "blue"))((0:4)/4)
```

```
##        [,1] [,2]   [,3]
## [1,] 255.00    0   0.00
## [2,] 191.25    0  63.75
## [3,] 127.50    0 127.50
## [4,]  63.75    0 191.25
## [5,]   0.00    0 255.00
```
The output from `colorRamp()` is a function that can return a numerical matrix. The matrix essentially represents colors in RGB values (red, green, and blue respectively), with both the initially-defined and interpolated colors. Let's now take a look at `colorRampPalette()`:


```r
colorRampPalette(c("red", "blue"))(5)
```

```
## [1] "#FF0000" "#BF003F" "#7F007F" "#3F00BF" "#0000FF"
```

The output from `colorRampPalette()`, different from `colorRamp()`, is a function that returns a fixed number (five in this case) of colors in HEX codes.

**See also**: [Exploratory Data Analysis with R by Roger Peng](https://bookdown.org/rdpeng/exdata/plotting-and-color-in-r.html#colorramp)

# RColorBrewer

The `brewer.pal()` function in `{RColorBrewer}` package would call out one of the pre-defined color palettes that one wish to use.


```r
library(RColorBrewer)
par(mar=c(3,4,2,2))
display.brewer.all()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />

Say you'd like to get three colors from `Set1`:


```r
brewer.pal(3, "Set1")
```

```
## [1] "#E41A1C" "#377EB8" "#4DAF4A"
```

**See also:** [Exploratory Data Analysis with R by Roger Peng](https://bookdown.org/rdpeng/exdata/plotting-and-color-in-r.html#using-the-rcolorbrewer-palettes)

**Take home message:** `{RColorBrewer}` only offer a limited number of options to choose from, which is a good starting point, whereas `{grDevices}` is much more flexible.
