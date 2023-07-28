---
title: Connect points in graph divided by facet
author: Yukai Zou
date: '2016-10-10'
slug: connect-points-in-graph-divided-by-facet
categories:
  - R
tags:
  - ggplot2
---




To do so, specify `group` attribute in `aes()` in ggplot2 expression. This would allow points connected in the subplots defined by `facet_wrap()` or `facet_grid()`.

Working example:


```r
dat <- data.frame(x = rep(1:3, 4),
                  y = c(1:12), 
                  individual = factor(c(1,1,1, 2,2,2, 3,3,3, 4,4,4)),
                  type = factor(c(rep("A", 6), rep("B", 6)))
)

# without specifying group
dat %>% ggplot(aes(x = x, y = y)) +
        geom_point() + facet_wrap(type ~ .) +
        geom_line()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-1-1.png" width="672" />

```r
# specify "individual" as grouping variable
 dat %>% ggplot(aes(x = x, y = y, group = individual)) +
        geom_point() + facet_wrap(type ~ .) +
        geom_line()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-1-2.png" width="672" />

