---
title: Remove legends in ggplot2
author: Yukai Zou
date: '2017-01-12'
slug: remove-legends-in-ggplot2
categories: []
tags:
  - ggplot2
---

To do so, use the `guides()` function in the ggplot expression:

- `guides(fill = FALSE)` remove the legends for inside filling.
- `guides(shape = FALSE)` remove the shape legends.
- `guides(fill = FALSE, shape = FALSE)` will remove both the fill and shape legends.
- `guides(color = FALSE)` remove the color legends (note the difference with `fill`).
