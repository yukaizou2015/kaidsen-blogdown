---
title: Change legend text in ggplot2
author: Yukai Zou
date: '2017-07-08'
slug: change-legend-text-in-ggplot2
categories:
  - R
tags:
  - ggplot2
---

To do so, apply `guides` function to the ggplot expression. 

For example:

- `guides(color = guide_legend(c("grp1", "grp2", ...)))`

would update the legends according to `color` attribute. 

Depending on the labeling, there might be other attributes such as shape, fill, linetype, etc.
