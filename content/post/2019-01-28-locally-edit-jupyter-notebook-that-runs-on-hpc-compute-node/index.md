---
title: Locally edit Jupyter notebook that runs on HPC compute node
author: Yukai Zou
date: '2019-01-28'
slug: locally-edit-jupyter-notebook-that-runs-on-hpc-compute-node
categories:
  - HPC
tags:
  - scripts
---

To do so, create a new blank file (call it whatever you like), and place a function:


```bash
function jupynote() {
ssh -t -t zou75@"$3".rcac.purdue.edu -L "$1":localhost:"$1" ssh "$2" -L "$1":localhost:"$1"
}
```

This function can be called after sourcing the file. 

- Update: This function has been tested at RCPC gilbreth cluster, but has not been tested on Iridis at the University of Southampton. Slight modifications are needed.
