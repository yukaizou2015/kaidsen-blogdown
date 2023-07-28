---
title: Transforming data frame
author: Yukai Zou
date: '2016-02-10'
slug: transforming-data-frame
categories:
  - R
tags:
  - base
  - reshape2
  - stats
---

# 1. melt()

This function comes from `{reshape2}` package. Can specify the `id` attribute so that those columns/variables are fixed.

Working example:



<a name="aggregate"></a>
# 2. aggregate()

This function comes from `{stats}` package. Collapse data by defined function.

Working example:


```r
aggregate(mpg ~ cyl, data = mtcars, mean)
```

```
##   cyl      mpg
## 1   4 26.66364
## 2   6 19.74286
## 3   8 15.10000
```

**See also:** [Notes for {dplyr} package](/2016/02/13/notes-for-dplyr-package/index.html#summarize)

# 3. cut()

Cut into different intervals; can specify labels.

Working example:



**See also:** [Convert p-values using stars.pvals() and cut()](/2016/03/25/convert-p-values-using-stars-pvals-and-cut/)

# 4. transform()

Add/change variable.

Working example:


