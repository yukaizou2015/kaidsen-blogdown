---
title: Access Mounted Shared Drives in WSL2
author: Yukai Zou
date: '2023-03-08'
slug: access-mounted-shared-drives-in-wsl2
categories:
  - Linux
tags:
  - scripts
---

I was looking for a way to access the shared drives that are mounted to Windows from within WSL2. It was apparent to me to mount local drives (e.g. C:\\ and D:\\), which typically have the path `/wsl/x`, but for shared drives (which are mounted network drives) this work differently.

I found a post in Stack Overflow [here](https://superuser.com/questions/1128634/how-to-access-mounted-network-drive-on-windows-linux-subsystem) which signposted to the Microsoft Learn Documentation [here](https://learn.microsoft.com/en-gb/archive/blogs/wsl/file-system-improvements-to-the-windows-subsystem-for-linux).

- `sudo mkdir /folder`
- `sudo mount -t drvfs '\\server\share' /folder`

This is very useful in that it leverages in linux commands sych as `rsync` to perform data back-up.

