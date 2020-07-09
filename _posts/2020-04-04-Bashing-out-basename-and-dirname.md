---
layout: post
author: John Scott
date: 2020-04-04
title: "Bashing out basename and dirname"
description: "How to get the path and filename in a bash shell script without using basename and dirname."
tags: [Bash, Scripting]
image: /public/images/bash.jpg
---
![Bash: The Bourne-Again Shell](/public/images/bash.jpg)

To find out the file and path components of a full filename, code similar to the following is often used:
```sh
fullname="/path/to/filename"
filename=$(basename "$fullname")
pathname=$(dirname "$fullname")
```
Doing this means subprocesses are spawned to run the ``basename`` and ``dirname`` commands, capturing their output and assigning it to the filename and pathname variables.

You can avoid using ``basename`` or ``dirname``. The following will help:

```sh
# Basename: Get everything after the last /
echo ${fullname##*/}

# Dirname: Get everything before the last /
echo ${fullname%/*}
```
There are some caveats with this. The variable must have a path separator in it. Whilst it is rather cryptic, it avoids spawning sub-processes for ``dirname`` and ``basename``. ``Basename`` can also strip the extension.

How does this work…

* ``$fullname`` is easy. This is always the variable’s value and ``${fullname}`` just marks the variable substitution. It can be used with script parameters too, such as ``${0}`` (which always seems to include at least one ‘/‘ character).

* The ``${fullname##*/}`` variable substitution is a form of ``${var##pattern}`` and ``${fullname%/*}`` is a form of ``${var%pattern}`` [parameter substitutions](https://www.tldp.org/LDP/abs/html/parameter-substitution.html) to remove substrings.

* For basename, ``${fullname##*/}`` removes the *longest* substring from the *front* of the variable (denoted by the ``##`` operator) matching the pattern ‘``*/``‘  – i.e. any character (denoted by ``*``) ending with ‘``/``‘. This leaves everything after the last ‘``/``‘ character – i.e. the ``basename``.

* For dirname, ``${fullname%/*}`` removes the *shortest* substring from the *end* of the variable (denoted with the ``%`` operator) matching the pattern ‘``/*``‘ –  a ‘``/``‘ followed by any character (denoted with ``*``). This leaves everything before the last ‘``/``‘ character – the path to the file without trailing path separator  –  i.e. ``/my/path/name`` instead of ``/my/path/name/``.

The way I remember whether it’s ``#``, ``##``, ``%`` or ``%%`` is one character for the *shortest* substring and two characters for the *longest* substring. Then hashtags have the hash at the *beginning* whilst percentages have a percent at the *end*. So:

* ``#`` is for removing the *shortest* pattern from the *beginning* of the variable.

* ``%%`` is for removing the *longest* pattern from the *end* of the variable.
