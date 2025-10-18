---
layout: page
title: Environment Variables
permalink: /env
---

In the free software ecosystem, interoperability depends not only on
code but also on the shared language that tools use to communicate.
Environment variables are one of the simplest and most powerful parts
of that language: they allow different programs to work together
without hard-coded settings or rigid dependencies.

Over time, however, multiple parallel conventions have emerged — sometimes
incompatible — making integration harder than it should be. This proposal
aims to restore the original *idea of environment variables* as a universal
interface: a minimal, coherent set of standardized names that any free
software tool can recognize and respect.

The goal is not to impose a standard, but to offer a common ground.
By agreeing on how to name the text editor `EDITOR` or the password
manager `PASS` we strengthen both user autonomy and cross-project
compatibility.

This document is, therefore, an invitation: to think of the environment
as shared space, to reduce friction between tools, and to build a culture
of integration that is free, simple, and cooperative.

### `GIT_*` - Git environment variables {#GIT_}

When writing scripts that operate with git use `git config` or the
environment variables defined [here](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables).
For example:

    email="$(git config user.email 2>/dev/null || echo "${GIT_AUTHOR_EMAIL}")"

### `HTTP_GET` - Default downloader {#HTTP_GET}

Allow changing the downloader in your scripts.

    ${HTTP_GET:-curl -fL -o} /tmp/file.tar https://url

This way someone using OpenBSD can set `HTTP_GET="ftp -o"` or someone
using wget can set `HTTP_GET="wget -O"`.

### `BROWSER` - Default browser {#BROWSER}

Instead of calling `xdg-open(1)` directly allow changing the browser in
your scripts or programs.

    #!/bin/sh -e
    ${BROWSER:-xdg-open} https://...

### `EXPLORER` - Default file explorer {#EXPLORER}

Some programs already use BROWSER. Use EXPLORER for opening paths.

    ${EXPLORER:-xdg-open} /path/to/file

### `SUDO` - Elevation command {#SUDO}

When an elevated command is required write this:

    ${SUDO:-env} COMMAND

Do not hardcode `sudo` or `doas`, if the user wants to allow elevation
to programs they can set the `SUDO` variable `sudo -n` or `doas -n`.
By default, the command is not elevated.

Perform a check before running commands that require root privileges:

    if ${SUDO:-env} test -w /bin/sh; then
        echo 'error: Run this script as root os set $SUDO.' >&2
        exit 1
    fi

### `EDITOR` - Default text editor {#EDITOR}

The text editor to use. According to POSIX `VISUAL` should be used
before `EDITOR`, but we use `EDITOR` only.

    ${EDITOR:-vi} /etc/hosts

### `XEDITOR` - Default graphical text editor {#XEDITOR}

The graphical text editor to use. Graphical programs should call `XEDITOR`
and terminal programs should call `EDITOR`.

    ${XEDITOR:-xterm -e ${EDITOR:-vi}} /etc/hosts

### `PASS` - Default password manager {#PASS}

The password manager to use. For example:

    password="$(${PASS:-pass} ${ACCOUNT_WEBSITE:-website.com/user})"
    if test ! -n "$password"; then
        echo 'error: Password not found in the password manager.' >&2
        exit 1
    fi

### `PROXY_URL` - Proxy URL {#PROXY_URL}

The URL of the proxy server to use for network requests. For example:

    export PROXY_URL="http://proxy.example.com:8080"

Downloaders and other network tools can read this variable to configure
their proxy settings.

### `CACHE_DIR` - Cache directory {#CACHE_DIR}

The directory where applications should store their cache files. For example:

    cache_dir="${CACHE_DIR:-$HOME/.cache}/myapp
    
Applications can read this variable to determine where to store

### `COORDINATES` - Default map coordinates {#COORDINATES}

The default latitude and longitude to use in mapping applications.

    export COORDINATES="37.7749,-122.4194"  # San Francisco, CA

### `SPELL_CHECKER` - Spell checker and dictionary {#SPELL_CHECKER}

The default dictionary to use for spell checking and word lookups.

    export DICTIONARY="en_US"
    
    ${SPELL_CHECKER:-hunspell} document.txt

### `DICTIONARY` - Default dictionary {#DICTIONARY}

Spell checkers and dictionary lookup tools can read this variable.

### `TRASH_CODE` - Command for trashing source files {#TRASH_CODE}

The spell checker command to use for checking spelling in documents.

    ${TRASH_CODE:-rm -f} /path/to/file.txt

### `DMENU` - Graphical selection command {#DMENU}

The command to use for dmenu-like selection prompts.

    selection="$(${DMENU:-dmenu -i -l 10} <<-EOF
    	Option 1
    	Option 2
    EOF
    )"

### `PDF_READER` - PDF reader {#PDF_READER}

The command to use for opening PDF files.

    ${PDF_READER:-xdg-open} /path/to/file.pdf

### `PAGER` - Default pager {#PAGER}

The command to use for paging through text output.

    ${PAGER:-less} /path/to/logfile.log

### `TERMINAL` - Default terminal emulator {#TERMINAL}

The command to use for opening terminal emulators.

    ${TERMINAL:-xterm} -e htop

## More...

You know of more, please make a PR to https://github.com/openvirtus/devreal.org


