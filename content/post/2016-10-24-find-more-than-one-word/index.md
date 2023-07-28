---
title: Find more than one word
author: Yukai Zou
date: '2016-10-24'
slug: find-more-than-one-word
categories:
  - Linux
tags:
  - scripts
---




`egrep` can be quite useful when sometimes one needs to extract more than one word within a piece of text.

Working example:

Here we have a txt file that has three lines of text:


```bash
cat example.txt
```

```
## Apple
## Orange
## Banana
```

To find the text "Apple":


```bash
cat example.txt | egrep "Apple"
```

```
## Apple
```

To find both "Apple" and "Banana", note that a pipe symbol is added between the two words without spacing:


```bash
cat example.txt | egrep "Apple|Banana"
```

```
## Apple
## Banana
```

