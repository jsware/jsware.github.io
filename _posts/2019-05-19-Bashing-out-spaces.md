---
layout: post
title: "Bashing out Spaces"
date: 2019-05-19 22:22
categories: Bash Shell Scripting
---
![Bash: The Bourne-Again Shell](http://www.jsware.io/images/bash.jpg)

There’s no need to use ``tr``, ``sed`` and ``awk`` to trim whitespace from variables as per [these examples](https://stackoverflow.com/questions/369758/how-to-trim-whitespace-from-a-bash-variable) (NB: one of the popular options is described here  – but not the most popular at the time of writing).

We’ll use ``OPTARG`` as the variable, purely because I used it to strip spaces when parsing options in a script.

```sh
# Trim leading whitespace
OPTARG="${OPTARG#"${OPTARG%%[![:space:]]*}"}"

# Trim trailing whitespace
OPTARG="${OPTARG%"${OPTARG##*[![:space:]]}"}"
```
These look quite complicated, but are easier to understand with a worked example:
```sh
OPTARG="     The quick brown fox   "
echo ">$OPTARG<"
# Outputs >     The quick brown fox   <
```
First what does the “internal” substitution do…
```sh
echo ">${OPTARG%%[![:space:]]*}<"
# Outputs >     <
```
This removes the *longest* substring from the *end* of ``OPTARG`` that is not whitespace followed by any character (``[![:space:]]*``) — i.e. remove everything from the first non-whitespace character to the end; effectively leaving all the whitespace from the beginning of ``OPTARG``.

This whitespace prefix is then used as a pattern to remove from the front of ``OPTARG``:
```sh
echo ">${OPTARG#"${OPTARG%%[![:space:]]*}"}<"
# Outputs >The quick brown fox   <
```
Trimming trailing whitespace does the opposite.
```sh
echo ">${OPTARG##*[![:space:]]}<"
# Outputs >   <
```
This removes from ``OPTARG`` the longest substring from the front of ``OPTARG `` – matching the pattern any character followed by a non-whitespace character
(``*[![:space:]]``). I.e. remove everything except the trailing spaces.

Next these trailing spaces are used as the pattern to remove from the end of ``OPTARG``:
```sh
OPTARG="${OPTARG%"${OPTARG##*[![:space:]]}"}"
# Outputs >     The quick brown fox<
```
Running both of these together trim leading and then trailing spaces:
```sh
OPTARG="     The quick brown fox   "
OPTARG="${OPTARG#"${OPTARG%%[![:space:]]*}"}"
OPTARG="${OPTARG%"${OPTARG##*[![:space:]]}"}"
echo ">$OPTARG<"
# Outputs >The quick brown fox<
```
## Fixing parsing errors
I have found that on some platforms (I forget which), removing the quotes around the internal substitution does not always work. It may be a script parsing issue, making the following not work. Keeping quotes around the internal substitution works:
```sh
OPTARG="     The quick brown fox   "
OPTARG="${OPTARG#${OPTARG%%[![:space:]]*}}"
OPTARG="${OPTARG%${OPTARG##*[![:space:]]}}"
echo ">$OPTARG<"
# Might not work on all UNIX, but should output >The quick brown fox<
```
Both work on OSX and Linux from where I write this blog. Maybe not on AIX or a different version of bash. Could be something about POSIX compliance. If you find a UNIX platform where it doesn’t work, let me know.
