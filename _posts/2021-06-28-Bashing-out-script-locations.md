---
title: "Bashing out script locations"
excerpt: "$(basename \"$0\") does not always give a script its own real location..."
image: &image /assets/images/gnu-bash.jpg
classes: wide
categories: Programming
tags: Unix Mac Bash Scripting
header:
  teaser: *image
redirect_from: /bash/2021/06/28/Bashing-out-script-locations/
---
I was writing a script recently that depends on additional directories relative to the script for supporting files. Initially it worked fine using the path to `$0`.

I have a number of useful scripts for different purposes with each having their own location. Rather than add each script's directory to my `PATH` I added symbolic links to these scripts in a `bin` directory already in my `PATH`.

Then the problems started...

![Bash: The Bourne-Again Shell](/assets/images/bash.jpg)

The problem is that `$0` or `${BASH_SOURCE[0]}` refer to the symbolic link, not the script the symbolic link targets. So using `dirname` to access files relative to the real script's location fails to find them.

Using `BASH_SOURCE` is not POSIX compliant, but works for regular scripts and when using `source script.sh` too. I could use that from here, but for simplicity I will stick with `$0` for now.

Back to the symbolic link problem. Initially, following the symbolic link with `readlink` sounds like an easy fix:

```sh
[[ -L $0 ]] && realScript="$(readlink "$0")"
```

This works great if the symbolic link is absolute and points at the real script:

```
% ls -l
total 1
lrwxr-xr-x  1 j*******k  s***f    24 26 Jun 13:02 link-to-script.sh -> /path/to/real-script.sh
```

Links are not always that absolute, so I wanted to include the logic to find the real script and real location. There are a number of scenarios to cater for:

1. The absolute link (`absolute-link.sh -> /path/to/real-script.sh`) already considered above.
1. The "same-directory" relative link (`relative-link.sh -> real-script.sh`) where a link is to another file in the same directory.
1. A "different-directory" relative link (`relative-link.sh -> ../path/to/real-script.sh` or `relative-link.sh -> subdirectory/to/real-script.sh`). These links are relative to the directory the link is in (i.e. not your current working directory).
1. Directory links for one/more of the parent directies of `real-script.sh`. For example, on Mac the `/tmp` directory is a symbolic link to `/private/tmp`. Any logic must ensure these directory links are resolved. If I call `/tmp/relative-link.sh` or `/tmp/real-script.sh` from scenario #2 or #3 above, the real script would be `/private/tmp/real-script.sh`, not `/tmp/real-script.sh` or `/private/tmp/relative-link.sh`.

The simplest logic would be:

```sh
#!/usr/bin/env bash
set -o errexit -o errtrace -o nounset -o pipefail # Robust scripting.

origDir="$(pwd)"
this="$0"
while [[ -L $this ]]; do
  cd "$(dirname "$this")"
  this="$(readlink "$(basename "$this")")"
done
scriptName="$(basename "$0")"
cd "$(dirname "$this")"
scriptDir="$(pwd)"
unset this
cd "$origDir"
```

Hopefully the above is mostly self explanatory. Setting `scriptName` to the `basename $0` is less confusing when you print help text or messages mentioning the script.

This can be semi-minified into fewer lines:

```sh
#!/usr/bin/env bash
set -Eeuo pipefail # Robust scripting.
origDir="$(pwd)";this="$0"
while [[ -L $this ]]; do cd "$(dirname "$this")";this="$(readlink "$(basename "$this")")";done
scriptName="$(basename "$0")";cd "$(dirname "$this")";scriptDir="$(pwd)";unset this;cd "$origDir"
```

With the above logic, `scriptName` is the script's initial name and `scriptDir` is the directory the real script is found in.  There are a number of potential issues with this logic:

* The initial directory of the script is lost. This may not be a problem if you are only interested in the real directory.
* The initial script name is kept, but the real script name is lost (e.g. `my-script.sh -> my-script-1.2.3.sh`). Again, perhaps not a problem depending on your needs. I find using the initial script name is more useful when printing help text or messages, than the real script's name.
* If any directories in the path to the real script are themselves symbolic links, they remain in the resulting `scriptDir` value (i.e. it's not technically the real directory). Again, this may be OK for your needs.
* There's lots of spawning of `pwd`, `basename` and `dirname` going on to navigate the chain of links (I don't think `readlink` can be avoided). You might view this as wasteful of resources.

If required, you can address the above issues (and support `source script.sh` with `{BASH_SOURCE[0]}` over `$0`). The logic I came up with is:

```sh
#!/usr/bin/env bash
set -o errexit -o errtrace -o nounset -o pipefail # Robust scripting.

cd .  # Protect from unset/relative PWD variable.

origDir="$PWD"                  # Save absolute current directory.
origScript="${BASH_SOURCE[0]}"  # Save the original script as called (include directory if missing).
[[ $origScript != */* ]] && origScript="./$origScript"

scriptName="${origScript##*/}"  # Get the script name (strip longest */ from start leaving name).
scriptDir="${origScript%/*}"    # Get the script directory (strip shortest /* from end leaving dir).

# Get script. origScript already contains a directory (for variable substitution) from above.
realScript="$origScript"

# While script is a link...
while [[ -L $realScript ]]; do
  cd "${realScript%/*}"                         # Change to the link's directory.
  realScript="$(readlink "${realScript##*/}")"  # Read the link (now in current directory). Ensure it has a directory.
  [[ $realScript != */* ]] && realScript="./$realScript"
done

cd -P "${realScript%/*}"            # Change to the real directory of the script.
realScript="$PWD/${realScript##*/}" # Ensure directories with symbolic links are resolved.
realName="${realScript##*/}"        # Get the real script name (strip longest */ from start leaving name).
realDir="$PWD"                      # Get the real script directory (now the current directory).

cd "$origDir" # Return to the original directory.
```

There's quite a lot going on here, so lets follow it through.

First is the script robustness statements.
```sh
#!/usr/bin/env bash
set -o errexit -o errtrace -o nounset -o pipefail
```
There's many discussions on Bash recommended practices (e.g. [this](https://kvz.io/bash-best-practices.html)).

Then we protect from a damaged `PWD` environment variable which is used rather than spawning `pwd` whenever I need the current working directory.
```sh
cd .  # Protect from unset/relative PWD variable.
```

The `PWD` environment variable always contains the current directory, unless you manually `unset PWD` or `export PWD=some/other/value` (why would you, but [defensive programming](https://en.wikipedia.org/wiki/Defensive_programming)). Using `cd` sets `PWD`, so is a quick and easy way over `PWD="$(pwd)"` (avoiding another process spawn).

Next we capture the original directory to return to if we resolve symbolic links. I find it useful in scripts anyway. We also capture the original script name provided by Bash too.

```sh
origDir="$PWD"                  # Save absolute current directory.
origScript="${BASH_SOURCE[0]}"  # Save the original script as called (include directory if missing).
[[ $origScript != */* ]] && origScript="./$origScript"
```

The last line above - `[[ $origScript != */* ]] && origScript="./$origScript"` - ensures that `origScript` contains at least one `/` directory separator character.

Most of the time `$origScript` will contain a path separator - either by running the script relative to the current directory (`./my-script.sh`) or by finding it in the `PATH` (`/usr/local/bin/my-script.sh`). However, if you `export PATH=".:$PATH"` (again - why would you? Perhaps you like Windows... so, defensive programming) then `$0` and `${BASH_SOURCE[0]}` will not include a directory. Not a problem for `dirname` but bad for the variable substitution used.

Now we have the `origScript` containing at least one directory separator, we can use parameter substitution to get the basic `scriptName` and `scriptDir` used to call the script (`scriptName` is useful when printing help text etc).

Parameter substitution avoids spawning `basename` and `dirname` processes. See [this post]({{ baseurl }}/bash/2020/04/04/Bashing-out-basename-and-dirname/) for details.

```sh
scriptName="${origScript##*/}"  # Get the script name (strip longest */ from start leaving name).
scriptDir="${origScript%/*}"    # Get the script directory (strip shortest /* from end leaving dir).
```

Now onto the main logic to resolve symbolic links and find the real script. This is performed in three sections.

- Start with the original script name.
- Follow it whilst the script is a symbolic link.
- When arriving at the non-symbolic link, get the real directory (remember `/tmp/real-script.sh` might actually be `/private/tmp/real-script.sh`).

We start with assuming the `realScript` is the original script value in `origScript`. This value already has at least one directory separator, so no additional check here.

```sh
# Get script. origScript already contains a directory (for variable substitution) from above.
realScript="$origScript"
```

Next, while `realScript` is a symbolic link (a `[[ -L $realScript ]]` check tests for that), we:

1. Change the to the directory of `realScript`. No need to resolve any directory links yet (just `cd` not `cd -P`) as we do that in step 3.
1. Read the link using its base name (now we're in the symbolic link's directory).
1. As elsewhere, ensure the linked-to name has at least one directory separator in it (remember "same-directory" links such as `relative-link.sh -> script.sh`).

```sh
# While script is a link...
while [[ -L $realScript ]]; do
  cd "${realScript%/*}"                         # Change to the link's directory.
  realScript="$(readlink "${realScript##*/}")"  # Read the link (now in current directory). Ensure it has a directory.
  [[ $realScript != */* ]] && realScript="./$realScript"
done
```

The final step changes to the `realScript` directory, rebuilds `realScript` and creates `realName` and `realDir` values.

```sh
cd -P "${realScript%/*}"            # Change to the real directory of the script.
realScript="$PWD/${realScript##*/}" # Ensure directories with symbolic links are resolved.
realName="${realScript##*/}"        # Get the real script name (strip longest */ from start leaving name).
realDir="$PWD"                      # Get the real script directory (now the current directory).
```

Rebuilding `realScript` is necessary here because the path to the real script file may include a symbolic link directory (e.g. `/tmp/real-script.sh` on Mac) that needs resolving.

Finally we change back to the original directory where we started initially so the rest of the script can reasonably expect we are in the directory from which it was executed.

```sh
cd "$origDir" # Return to the original directory.
```

This time we also don't `cd -P` because the user may have been in a directory involving symbolic links. If we started displaying a different directory, the user might think the script has failed (e.g. displaying `File /private/tmp/data.csv not found.` where-as `File /tmp/data.csv not found.` is less confusing for a file in `/tmp`).

Note this logic does not handle symbolic link errors such as broken links or circular references (`one.sh -> two.sh` and `two.sh -> one.sh`). For a script to find its own real name and location this is not a valid scenario. Bash had to execute the script, so any problems resolving the real script (such as broken links) can't realisitically exist (technically, you could break the links after Bash had resolved the real script name and location and before the above code completed, but that's an edge case not normally needed).

If you tried to use the logic above to find the real name and location of a file to process, symbolic link errors would need to be handled (possibly with something like `[[ -r $dataFile ]] || exit 1` first).

There's quite a lot of boilerplate to reliably get the `origScript`, `realScript` and associated parts. Unfortunately sourcing in a helper-script in the `dirname "${BASH_SOURCE[0]}"` location would suffer the same problem I started with. You would need to create an associated symbolic link to the helper script too or use a fixed location.

A [Bash Minifier](https://bash-minifier.appspot.com/) can produce a single script line. If you want to semi-minify this in your script (keeping it a little more readable) - as I have done - try the following four lines:

```sh
cd .;origDir="$PWD";origScript="${BASH_SOURCE[0]}";[[ $origScript != */* ]]&&origScript="./$origScript"
realScript="$origScript";scriptName="${origScript##*/}";scriptDir="${origScript%/*}"
while [[ -L $realScript ]];do cd "${realScript%/*}";realScript="$(readlink "${realScript##*/}")";[[ $realScript != */* ]]&&realScript="./$realScript";done
cd -P "${realScript%/*}";realScript="$PWD/${realScript##*/}";realDir="$PWD";realName="${realScript##*/}";cd "$origDir"
```

Some might think the above too cryptic and uses dusty corners of the Bash language.  Particularly [parameter substitutions](https://tldp.org/LDP/abs/html/parameter-substitution.html) might not be well understood.  Google is your friend here. A quick [Google](https://www.google.com) for `bash variable ##` and the [results are useful](https://www.google.com/search?q=bash+variable+%23%23).

Elsewhere in scripts, I would follow [typical guidelines](https://bash3boilerplate.sh/) - avoiding minified code and cryptic scripts. However, I don't want this boilerplate code to detract from real script's logic.

You could stick with the initial script (expanded or on three lines). I leave this readability consideration with you.
