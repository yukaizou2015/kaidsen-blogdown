---
title: Change colors in ggplot2
author: Yukai Zou
date: '2017-07-08'
slug: change-default-color-in-ggplot2
categories:
  - R
tags:
  - ggplot2
---

The [RColorBrewer](https://cran.r-project.org/web/packages/RColorBrewer/index.html) package contains a wide range of color palettes to choose from. 

A quick reference can be found [here](https://www.datanovia.com/en/blog/the-a-z-of-rcolorbrewer-palette/#:~:text=RColorBrewer%20is%20an%20R%20package,Install%20and%20load%20RcolorBrewer%20package).

For example:

- `brewer.pal(n. "Set1")`

where 3 is the minimum value for `n`.

See [here](https://www.r-bloggers.com/2013/09/how-to-expand-color-palette-with-ggplot-and-rcolorbrewer/) for an example applying `brewer.pal()` from within `scale_fill_manual()` in ggplot2.
