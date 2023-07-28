---
title: Read table from PDF using {tabulizer}
author: Yukai Zou
date: '2023-04-02'
slug: read-table-from-pdf-using-tabulizer
categories:
  - R
tags:
  - tabulizer
---

# Installlation

For MacOS, `{tabulizer}` can be installed [here]https://wolfpaulus.com/installing-java-on-macos/).

Run this command:

```
brew install --cask temurin
```

## Cheecking Java version

After checking `java --version`:
openjdk 20 2023-03-21
OpenJDK Runtime Environment Temurin-20+36 (build 20+36)
OpenJDK 64-Bit Server VM Temurin-20+36 (build 20+36, mixed mode, sharing)

Now I can load library(rJava), and install:

`remotes::install_github(c("ropensci/tabulizerjars", "ropensci/tabulizer"))`
