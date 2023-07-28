---
title: Date conversion
author: Yukai Zou
date: '2016-04-29'
slug: date-conversion
categories:
  - R
tags:
  - base
---

Converting date records into `Date` class comprises one of the essential processing in R. 

"Should day or month comes first?" That's right, data is never clean, especially for dates. The inconsistent formatting can cause confusions among team members and errors in analyses and reports, so do make every effort to clean it up.

# Date formats

The `format` attribute in `as.Date()` to try to harmonize these conflicts. Full details of date formats can be referenced at [this post](https://www.r-bloggers.com/2013/08/date-formats-in-r/). Here I'd like to compare the difference between `%y` and `%Y`.

- `$y` converts year entries without century (e.g. 23), whereas 
- `%Y` converts year entries that contains century (e.g. 1923).

Working example:


```r
as.Date("03/05/23", format = "%d/%m/%y")
```

```
## [1] "2023-05-03"
```

Note how `%y` has made the assumption that the converted output falls in the current century. This clearly makes no sense if the entry is actually the DOB of a patient. Some sort of data cleaning is required here to convert year using `%Y`:


```r
as.Date("03/05/1923", format = "%d/%m/%Y")
```

```
## [1] "1923-05-03"
```

If you don't clean your data here's how it will look like:


```r
as.Date("03/05/23", format = "%d/%m/%Y")
```

```
## [1] "0023-05-03"
```

## Take home message

When in doubt, always ask to clarify. Communication is key. 

But hey what's the right order, date or month? 

No comment, please go with the flow, American and Brit folks.
