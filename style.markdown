---
layout: page
title: Style Guide
permalink: /style
---

This is a list of preferred styles and conventions for writing code in
our humble opinion. It is a work in progress and will be updated as needed.

## General Guidelines

### Configuration with environment variables

The programs should be configured using environment variables. Check
our environment variable list [here](/env).

### Programs, not plugins

We prefer standalone programs that can be run independently rather than
plugins that require a specific host application. If a program requires
extension, it should be extensible by writing additional programs.

For example, image you have a program named `foo` that performs checks
on a text. For defining new checks, instead of exposing a plugin API
`foo` should find and call program with a certain name `foo__addon` for
example, and document the API `foo__addon` should expose.

    $ detect_animals (program) (no)
      |--> dogs.so (library)
      '--> cats.so (library)
    
    $ detect_animals (program) (yes)
      |--> detect_animals__dogs (program)
      '--> detect_animals__cats (program)

This way the operator can use any programming language. If the add-ons
needed to call some facilities from the program then write a helper
program for that. Check [definitions](/env#Definitions).

### Programs should support "--help", "-h", "-V", "-v".

Programs should print a help summary when --help or -h is the first
argument. With `-V`, it should print the configuration. Use `-v` and `$VERBOSE`
for activating verbose messages.

If possible be `getopt(1/3)` compatible.

### Scripts should support sourcing/inclusion.

Programs written in a scripting language should support being included.
This allows to create bundles.

Shell scripts:

    if test @"${SCRNAME:-$(basename "$0")}" = @"my-program"; then
        ...
    fi

Python scripts:

    if __name__ == '__main__':
        ...

Tcl/Tk scripts:

    if {[file tail $argv0] eq [file tail [info script]]} {
        ...
    }

### Print the trace only when `$DEBUG` is set.

Some scripts when failing to read a file, or any other common failure
print a trace, it is better to print a concise "Can't open X" error
instead. Print the trace if DEBUG environment variable is set.

### A working Makefile or GNUmakefile.

All makefiles shall support `all` and `install`. The `install` target
shall not depend on `all` so that `sudo make install` works.

If the makefile is POSIX compatible, name it Makefile, otherwise
name it GNUmakefile.

All makefiles shall support `DESTDIR` and `PREFIX` to specify the
installation target.

## Scripting programming languages

### POSIX Shell programming language.

You should follow the [POSIX standard](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html).

The general template:

    #!/bin/sh -e
    #h: Usage: my-program ...
    #h:
    #h: Description.
    my_program() {
        ...
    }
    if test @"${SCRNAME:-$(basename "$0")}" = @"my-program"; then
        case "${1}" in
            ''|-h|--help) sed -n 's/^ *#h: \{0,1\}//p' "$0";;
            -V)           true;;
            *)            my_program "$@"; exit 0;;
        esac
    fi

In parts:

1. `set -e` : All scripts should run with `sh -e` or `set -e` so that
   the program aborts in the first error (as any other sane scripting
   language).
2. `#h:` : Help string.
3. `-V` : Prints the environment variables that the program uses.

Command line arguments:

    ...
    my_program() {
        local OPTIND=1 optopt output=
        while getopts "o:" optopt; do # OPTARG
            case $optopt in
                'o') output="$OPTARG";;
                \?)  return 1;;
            esac
        done
        shift $(( $OPTIND - 1 ))
        for arg in "$@"; do
            ...
        done
    }
    ...

### Python programming language.

The general template is as follows:

    #!/usr/bin/env python3
    """
    Usage: my-program ARGS...
    
    description.
    """
    import os
    import sys
    
    def my_program(arguments):
        ...
    
    if __name__ == '__main__':
        if len(sys.argv) <= 1 or sys.argv[1] in ['-h', '--help']:
            sys.stdout.write(__doc__.strip()+'\n')
            sys.exit(0)
        elif os.getenv('DEBUG') is None:
            try:
                my_program(sys.argv[1:])
            except Exception as err:
                sys.stderr.write('my-program: error: ' + str(err) + '.\n')
                sys.exit(2)
        else:
            my_program(sys.argv[1:])

Command line arguments:

    ...
    import getopt
    ...
    def my_program(arguments):
        opts, args = getopt.getopt(arguments, 'o:')
        for optopt, optarg in opts:
            if optopt == 'o':
                ...
    ...

### Tcl/Tk programming language.

The general template:

    #!/usr/bin/env tclsh
    set MY_PROGRAM_HELP "Usage: my_program ...
    
    ..."
    proc my_program { args } {
        ...
    }
    if {[file tail $argv0] eq [file tail [info script]]} {
        if {[lsearch {"-h" "--help" ""} [lindex $argv 0]] != -1} {
            puts $MY_PROGRAM_HELP
        } elseif {[info exists env(DEBUG)]} {
            my_program {*}$argv
        } elseif {[catch {
            my_program {*}$argv
        } err]} {
            puts stderr "my_program: $err"
            exit 1
        }
    }


