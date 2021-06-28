---
title: "Bashing out basename and dirname"
categories:
  - Bash
tags:
  - Programming
header:
  teaser: /assets/images/gnu-bash.jpg
---
To find out the file and path components of a full filename, code similar to the following is often used:
```sh
fullname="/path/to/filename"
filename=$(basename "$fullname")
pathname=$(dirname "$fullname")
```

![Bash: The Bourne-Again Shell](/assets/images/bash.jpg)

Doing this means subprocesses are spawned to run the ``basename`` and ``dirname`` commands, capturing their output and assigning it to the filename and pathname variables.

You can avoid using ``basename`` or ``dirname``. The following will help:

```sh
# Basename: Get everything after the last /
echo ${fullname##*/}

# Dirname: Get everything before the last /
echo ${fullname%/*}
```
There are some caveats with this. The variable must have a path separator in it. This can be easily fixed with:

```sh
[[ ${fullname} != */* ]] && fullname="./$fullname"
```

This checks for a `/` in `fullname`. If one is missing, prefix it with the current directory. Alternatively you could use `$PWD/$fullname`.

Whilst the `##*/` and `%/*` are rather cryptic, they avoid spawning sub-processes for ``dirname`` and ``basename``. 

However, remember that `basename` can strip the extension which needs extra variable substitution with this approach.

How do `${fullname##*/}` and `${fullname%/*}` work?

* ``$fullname`` is easy. This is always the variable’s value and ``${fullname}`` just marks the variable's name. Curly brackets can be used with script parameters too, such as ``${0}`` (which always seems to include at least one ‘/‘ character). We use the curly brackets to perform parameter substitution.

* The ``${fullname##*/}`` expression is a form of ``${var##pattern}`` and ``${fullname%/*}`` is a form of ``${var%pattern}`` [parameter substitutions](https://www.tldp.org/LDP/abs/html/parameter-substitution.html) to remove substrings.

* For a filename, ``${fullname##*/}`` removes the *longest* substring from the *front* of the variable (denoted by the ``##`` operator) matching the pattern ‘``*/``‘  – i.e. any character (denoted by ``*``) ending with ‘``/``‘. This leaves everything after the last ‘``/``‘ character – i.e. the ``basename``.

* For a directory, ``${fullname%/*}`` removes the *shortest* substring from the *end* of the variable (denoted with the ``%`` operator) matching the pattern ‘``/*``‘ –  a ‘``/``‘ followed by any character (denoted with ``*``). This leaves everything before the last ‘``/``‘ character – the path to the file without trailing path separator  –  i.e. ``/my/path/name`` instead of ``/my/path/name/``.

The way I remember whether it’s ``#``, ``##``, ``%`` or ``%%`` is one character for the *shortest* substring and two characters for the *longest* substring. Then hashtags have the hash at the *beginning* whilst percentages have a percent at the *end*. So:

* ``##`` is for removing the *longest* pattern from the *beginning* of the variable (i.e. the directory name).

* ``%`` is for removing the *shortest* pattern from the *end* of the variable (i.e. the file name).
