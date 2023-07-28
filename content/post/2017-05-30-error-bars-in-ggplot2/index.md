---
title: Error bars in ggplot2
author: Yukai Zou
date: '2017-05-30'
slug: error-bars-in-ggplot2
categories:
  - R
tags:
  - ggplot2
---

You should already have standard errors (`se`) calculated beforehand. To add the error bars, use the `geom_errorbar()` function in ggplot expression. A working example might look like this:

- `geom_errorbar(aes(ymin = x - se, ymax = x + se))`

# Positioning

Adding the `position_dodge()` function in ggplot expression can map error bar correctly. 

- Additionally, one can specify the `width` attribute to further tailor the appearance.
