---
title: Kubernetes and Bland-Altman plots
author: Yukai Zou
date: '2023-05-18'
slug: kubernetes-and-bland-altman-plots
categories:
  - HPC
  - Statistics
tags:
  - Kubernetes
  - Bland-Altman
---

# Kubernetes

This Coronation Bank Holiday weekend, I learnt something about Kubernetes and it's such a great management tool for deploying containerised solutions. This is a home project that I'm slowly working on. Can start with the Gaming PC and Optiplex.

## How to generate token

See this guide [here](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md).

Create separate yaml files for ServiceAccount and for ClusterRoleBinding, then run:

```
kubectl apply -f filename.yaml
```

to create them.

Create token by running:

```
kubectl -n kubernetes-dashboard create token admin-user
```

Then, run

```
kubectl proxy
```

and visit http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

Paste the token into the field.

At the end of session, clean up by running:

```
kubectl -n kubernetes-dashboard delete serviceaccount admin-user
kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user
```

**See Also**:

- [Install Kubernetes on Windows](https://www.knowledgehut.com/blog/devops/install-kubernetes-on-windows)
- (For Linux) [Creating kubernetes cluster with master and worker nodes](https://www.ibm.com/docs/en/cdfsp/7.6.1.x?topic=kubernetes-creating-cluster-master-worker-nodes)

# Bland-Altman plots

I grasped the concept as similar to Tukey mean difference plot, but was called differently in the field of medicine statistics. 

There is an R package `{BlandAltmanLeh}` which does this job. 

Read this [step-by-step tutorial](https://www.r-bloggers.com/2021/08/plot-differences-in-two-measurements-bland-altman-plot-in-r/) that dives in with loads of details.