---
title: Left outer join
author: Yukai Zou
date: '2016-02-28'
slug: left-outer-join
categories:
  - R
tags:
  - sqldf
  - dplyr
  - base
---



_Outer join_ is an operation in [SQL](https://www.w3schools.com/sql/) to match tables, where _all_ rows of one of the two tables are used to cross reference with the other table. The output from outer join is a new table that contains _all_ rows of the first table, with matching records of the other **AND** missing values for those without matching. 

When using _left outer join_ statement, the table specified _before_ the statement is used to retrieve the rows, e.g.:

 - In `dat1 LEFT OUTER JOIN dat2`, rows will be retrieved from `dat1`.
 - On the contrary, in `dat1 RIGHT OUTER JOIN dat2`, rows will be retrieved from `dat2`.

Now let's consider two tables that need to be merged:


```r
dat1 <- data.frame(ID = 1:10,
                   X = c(rep("A", 3), rep(NA, 7)))
dat2 <- data.frame(ID=5:10,
                   X = rep("B", 6))
dat1
```

```
##    ID    X
## 1   1    A
## 2   2    A
## 3   3    A
## 4   4 <NA>
## 5   5 <NA>
## 6   6 <NA>
## 7   7 <NA>
## 8   8 <NA>
## 9   9 <NA>
## 10 10 <NA>
```

```r
dat2
```

```
##   ID X
## 1  5 B
## 2  6 B
## 3  7 B
## 4  8 B
## 5  9 B
## 6 10 B
```

# sqldf: select ... on

`{sqldf}` is an R package that runs [SQL](https://www.w3schools.com/sql/) statements on R data frames. One of the commonly used SQL statements is `SELECT`, which returns a data frame containing the selected values from a dataset.

 - `select ... on` will result in a query that contains all rows from table A and only the matched rows from table B. The rest rows are filled with missing values (`NA`).


```r
sqldf("select * from dat1 left outer join dat2 on dat1.ID = dat2.ID")
```

```
##    ID    X ID    X
## 1   1    A NA <NA>
## 2   2    A NA <NA>
## 3   3    A NA <NA>
## 4   4 <NA> NA <NA>
## 5   5 <NA>  5    B
## 6   6 <NA>  6    B
## 7   7 <NA>  7    B
## 8   8 <NA>  8    B
## 9   9 <NA>  9    B
## 10 10 <NA> 10    B
```

A shortcoming is that column `ID` appears twice in the output, which is a bit redundant. 

**See also:** [Stack Overflow](https://stackoverflow.com/questions/16964799/how-can-i-perform-full-outer-joins-of-large-data-sets-in-r)

# merge()

There's a learning curve to familiarize with SQL, which is beneficial and have fun with that. But in my opinion, a more neat solution to carry out left outer join in R is to use the `merge()` function.


```r
dat1 %>% merge(dat2, by = "ID", all = T)
```

```
##    ID  X.x  X.y
## 1   1    A <NA>
## 2   2    A <NA>
## 3   3    A <NA>
## 4   4 <NA> <NA>
## 5   5 <NA>    B
## 6   6 <NA>    B
## 7   7 <NA>    B
## 8   8 <NA>    B
## 9   9 <NA>    B
## 10 10 <NA>    B
```
 
Here we specified the `by` attribute to state that all the rows from column `ID` would be used for merging. The output data frame returned two columns, `X.x` and `X.y`, that correspond to `dat1` and `dat2` respectively.

**See also:** [R Documentation](https://cran.r-project.org/web/packages/sqldf/sqldf.pdf), [Notes for {dplyr} package](/2016/02/13/notes-for-dplyr-package/index.html#dplyr-left-join)
