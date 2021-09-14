---
title: "A shell script logging framework"
image: &image /assets/images/log-file.png
categories: Programming
tags: Bash Scripting
header:
  teaser: *image
toc: true
redirect_from: /bash/2020/02/15/Shlog-a-Shell-Logging-Framework/
---
"`ShLog`" is a shell script logging framework. Check out the framework [here](https://github.com/jsware/shlog).

(**Pronunciation**: How the great Sean Connery might say the word '*slog*').

The `ShLog` framework provides a set of logging functions for shell scripts. If you are writing a shell script, you can `source shloglib.sh` at the beginning of your script, making a set of `ShLog*` functions available.

Additionally a `shlog` wrapper script is available to capture existing script output into rotating log files without modification.

## ShLogging functions

* `ShLogError` outputs messages prefixed with ERROR: to *stderr*;
* `ShLogWarning` outputs messages prefixed with WARNING: to *stderr*;
* `ShLogNotice` outputs messages prefixed with NOTICE: to *stdout*;
* `ShLogInfo` outputs messages without a prefix to *stdout*;
* `ShLogConfig` outputs configuration messages to *stdout*;
* `ShLogDebug` outputs more detailed debugging to *stdout*;
* `ShLogFine` outputs fine grained messages to *stdout*;
* `ShLogFiner` outputs more detailed messages to *stdout*;
* `ShLogFinest` outputs the finest messages to *stdout*.

*NB: The logging functions (`ShLogWarning` and `ShLogError`) output messages to standard error whilst the others output to standard output.*

Use the `ShLogLevel` function to sets the logging level. The default level is `INFO` with `NOTICE`, `WARNING` and `ERROR` also producing output. More detail can be chosen with `CONFIG`, `DEBUG`, `FINE`, `FINER` and `FINEST`). The value `ALL` is the same as `FINEST`.

The `ShLogLevel` function can take numbers (0 being `INFO` up-to 3 for `ERROR` and -5 for `FINEST`). `ShLogLevel` can take the above strings which it maps to these values and stores them in `SHLOG_LEVEL`.

Output using `ShLog*` functions log these same messages to a rotating set of log files prefixed with a timestamp.

## Instrumenting functions

Functions can be instrumented with `ShLogEnter` and `ShLogLeave`. For example:

```sh
source shloglib.sh

MyFunction() {
  ShLogEnter $FUNCNAME $@
  local rc=0

  ShLogInfo "Hello $@!"
  ...

  ShLogLeave $FUNCNAME returns $rc
  return $rc
}

ShLogLevel ALL
MyFunction 1 2 3 4 World
```
produces the log output with messages inside the function > indented inline with the function name.

```
 Logging level ALL
 ->MyFunction 1 2 3 4
   Hello 1 2 3 4 World!
 <-MyFunction returns 0
```

Notice how the output within the function is indented. Recursion produces more indentation!

## Using the shlog wrapper script
The `shlog` wrapper script can capture script output to a rotating set of log files without modification of the original script.

The `shlog` wrapper script takes the following options:
```
Usage: shlog [Options] [-v] [-x] Command [CommandArguments]
Run a command, logging output to rotating log files.

Options:
  -b Run script in background (Default foreground).
  -c Log file count (Default 10).
  -f Log file name  (Default ~/{Script}.log).
  -q Quiet (No terminal input/output).
  -s Log file size in KB (Default 1MB).

  -v Verbose.
  -x Debug.
```
Arguments control the name, size and number of rotating log files. Additionally the script can be run in the background (using the `-b` option), or run in quiet mode (using the `-q` option).

The `shlog` script can be run in verbose, or debug to output progression of the `shlog` wrapper script (this does not affect the output of the logged script - this could be run in quiet mode).

Happy shlogging! See the [README](https://github.com/jsware/shlog/blob/master/README.md) for more information.
