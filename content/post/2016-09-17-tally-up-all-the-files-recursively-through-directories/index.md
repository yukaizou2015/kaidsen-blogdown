---
title: Tally up all the files recursively through directories
author: Yukai Zou
date: '2016-09-17'
slug: tally-up-all-the-files-recursively-through-directories
categories:
  - Linux
tags:
  - scripts
---

Every now and then there may arise a need of asking "How many files do I have under certain folders"? 

First thing first, expression upfront:


```bash
find * -maxdepth 1 -type d | while read -r dir;
do
        printf "%s:\t" "$dir";
        find "$dir" -type f | wc -l
done
```

Here's how it works: to break things up, commands used here include

- `find` is a useful command for searching files/folders.
  - `-maxdepth 1` will search subdirectories _only one level down_;
  - `-type d` looks for _directories_, and `-type f` looks for _files_;
- A `while` loop that ends when the condition is met, in this case, reaching the end of `dir` variable.
- `read` is a command that can read a single line from standard input, then splitting the input into words can may be used by other commands.
  - `-r` deactivates the unexpected behavior of breaking up long lines with a trailing backslash character (see [here](https://unix.stackexchange.com/questions/192786/what-is-the-meaning-of-read-r)).
- `printf` outputs string of texts defined by user.
  - `%s` is a specifier that outputs the entire argument in literal form;
  - `\t` is a specifier to print out TAB and add some spacing;
  - Adding quotation marks is considered more robust, considering that some folder names may contain spaces that may confuse the execution.
- `wc -l` returns the counts

Try it yourself to see how the outputs look like, maybe tweak a little to make it work for your case, and put in a function so that you don't have to code it up every time!
