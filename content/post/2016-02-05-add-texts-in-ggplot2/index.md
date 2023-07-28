---
title: Add texts in ggplot2
author: Yukai Zou
date: '2016-02-05'
slug: add-texts-in-ggplot2
categories:
  - R
tags:
  - ggplot2
---



To do so, use the `geom_text()` function in ggplot expression.

 - Specify the `label` attribute in the statement of aesthetic mapping
 - If needed, justify the positioning of the mapped texts by the `hjust` and `vjust` attributes.

Working example:


```r
mtcars[1:6, ] %>% ggplot(aes(x = wt, y = mpg)) + geom_point() + 
        # Add mpg values onto the plot, and justify the position vertically
        geom_text(aes(label = mpg), vjust = 1.5) +
        ylim(c(15, 25))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-1-1.png" width="672" />

**See also:** [Tidyverse documentation](https://ggplot2.tidyverse.org/reference/geom_text.html)
