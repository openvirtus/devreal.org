---
layout: page
title: Environment Variables
permalink: /env
---

The purpose of this document is to help to homogenize the environment variable
names used by the programs that use our [style guide](/style).

## Definitions

- Script/program : In this document both are considered equal. Both programs
  and scripts can read environment variables.

- The programmer : Is the person that writes the programs that read the
  environment variables. He/she wants to share this program.

- The operator : Is the one setting the environment variables for configuring
  the programs. He/she writes the config-scripts too, normally not shared.

- config-scripts : Programs can call scripts defined by the operator "config scripts"
  when some dynamic behaviour is required. Check [$SSH_H_LIST](#SSH_H_LIST) for
  an example.

## Git - Version Control System

Official environment variables [here](https://git-scm.com/book/en/v2/Git-Internals-Environment-Variables).

When writing scripts that operate with git use `git config`.

    #!/bin/sh -e
    email="$(git config myscript.config 2>/dev/null || echo default_value)"
    ...

## OpenSSH - Connectivity tool for remote login

A machine : A machine is what the ssh(1) man page regards to "destination", it
is usually `user@host`, but the operator can configure names in the `~/.ssh/config`
file as:

    Host qemu1
        HostName 127.0.0.1
        User root
        Port 23101

Then get the settings with:

    #!/bin/sh -e
    addr="$(ssh -G qemu1 | sed 's|^hostname  *||p')"
    ping "$addr"

### `SSH_H_LIST`

Scripts that want to receive multiple ssh hostnames should call the program
defined in this environment variable to receive the list.

Example:

    [/src/operator/bin/list_machines]
    #!/bin/sh -e
    IFS=','
    for n in $1; do
        case "$1" in 
            l)    echo >&2 "Machines: lab1 lab2"; exit 1;;
            lab1) echo "m1,m2,m3";;
            lab2) echo "user1@pc1,user2@172.90.20.13";;
            *)    echo "$1";;
        esac
    done

    [/src/programmer/bin/ssh-h-something]
    #!/bin/sh -e
    for m in $(${SSH_H_LIST:-echo} "$1" | tr ',' ' '); do
        echo "== $m"
        ssh "$m" "OPERATIONS..."
    done
        
## The World Wide Web WWW (CURL, ...)

### `PROXY_URL`

Some organizations have corporate firewalls and proxies that make the
engineer's life miserable. The programmer can write scripts that honour
`$PROXY_URL`, then with curl:

    curl -o /tmp/file.tar ${PROXY_URL:+ -x "${PROXY_URL}" } https://url

### `BROWSER` and `EXPLORER`

Instead of calling `xdg-open(1)` directly allow changing the browser in
your scripts.

    #!/bin/sh -e
    ${BROWSER:-xdg-open} https://...

Some programs already use BROWSER. Use EXPLORER for opening paths.

    ${EXPLORER:-xdg-open} /path/to/file

## Scripts

### `SUDO`

When an elevated command is required do this:

    ${SUDO:-env} COMMAND

Then the user can set SUDO to `sudo -n` or `doas -n` or execute the
command as root. You can perform a check:

    if ${SUDO:-env} test -w /bin/sh; then
        echo 'error: Run this script as root os set $SUDO.' >&2
        exit 1
    fi

### `EDITOR` (POSIX)

The text editor to use. According to POSIX `VISUAL` should be used
before `EDITOR`, but we use `EDITOR` only.

    ${EDITOR:-vi} /etc/hosts

### `XEDITOR`

The graphical text editor to use. Graphical programs should call `XEDITOR`
and terminal programs should call `EDITOR`.

    ${XEDITOR:-xterm -e ${EDITOR:-vi}} /etc/hosts

## More...

You know of more, please make a PR to https://github.com/openvirtus/devreal.org


