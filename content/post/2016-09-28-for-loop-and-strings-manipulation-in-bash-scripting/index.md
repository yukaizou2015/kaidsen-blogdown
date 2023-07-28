---
title: For-loop and strings manipulation in bash scripting
author: Yukai Zou
date: '2016-09-28'
slug: for-loop-and-strings-manipulation-in-bash-scripting
categories:
  - Linux
tags:
  - scripts
---

# Passing variable to a regular for-loop

Considers the for-loop expression below:


```bash
for ((i=0; i<$Index; i++))
```

one can essentially pass the output from the word count command `wc -l` to the `Index` variable, to loop through files/folders. 

Might not be the simplest / most efficient way for coding up for-loop, but it does works for carrying out this type of tasks, and it's relatively clear in my opinion to see how it works.

# Strings manipulation: _echo_ and _grep_

`echo` and `grep` are being used A LOT. Familiarizing with these two commands are the key to build up your confidence to manipulate strings in Linux.

## _echo_

In many cases there's a need of testing a piece of scripts before actually running it. "`echo ...`" always helps by returning the output as a string of text in the console, and in that way, I know what's exactly going on. 

Say you want to remove some temporary files at the end of a script, however, you don't want to delete anything yet, and for testing purpose you just want to peek what the script will do. To demonstrate a use case for `echo`, and this is merely one way of achieving the goal:


```bash
echo rm file1 file2
# Commented out for testing
# rm file1 file2
```

```
## rm file1 file2
```

Once checking the output is correct, you can now safely un-comment the actual code (`rm file1 file2``).

## _grep_

On the other hand, the `grep` commands allows identifying the matched pattern. 

 - `grep "..."` can find the pattern that matches `...` and return the entire line in the console.
 
I can then quickly locate the specific contents I am looking for, often from large chunks of texts. 

You can find more details about `grep` from [this post](https://www.digitalocean.com/community/tutorials/grep-command-in-linux-unix).

# Strings manipulation: the _cut_ command

`cut` is quite a neat and handy command for for strings manipulation. Lots of tutorials out there, [this](https://www.geeksforgeeks.org/cut-command-linux-examples/) is a good one.

- `cut -c 5-` will obtain a substring starting from _the 5th character_ and omit the rest beforehand.

Working example:


```bash
a="helloworld"
echo $a
```

```
## helloworld
```


```bash
a="helloworld"
echo $a | cut -c 6-
```

```
## world
```

# String manipulation: \# and %

- `#` removes _prefix_
- `%` removes _suffix_

These two symbols can sometimes be confusing in string manipulation if not being used often.

Working examples (Note the slight different order between the wildcard and underline for these two cases):


```bash
a="hello_world"

# remove prefix
echo ${a#*_}
```

```
## world
```

the prefix `hello` ending in "_" is removed.


```bash
a="hello_world"

# remove suffix
echo ${a%_*}
```

```
## hello
```

the suffix `hello` starting with "_" is removed. 
