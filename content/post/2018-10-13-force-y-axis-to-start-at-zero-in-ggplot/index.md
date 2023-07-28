---
title: Force y-axis to start at zero in ggplot
author: Yukai Zou
date: '2018-10-13'
slug: force-y-axis-to-start-at-zero-in-ggplot
categories:
  - R
tags:
  - R
---



To do so, add the following statement in ggplot expression:


```r
scale_y_continuous(expand=c(0,0))
```

```
## <ScaleContinuousPosition>
##  Range:  
##  Limits:    0 --    1
```

