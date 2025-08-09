---
layout: page
title: Terminal tools for a real sustained development.
---

Modern software development feels like chasing smoke, frameworks rise
and fall, GUIs shift faster than we can learn them, and the tools we
depend on are often opaque, bloated, or short-lived. *Real development*
seems impossible, not lasting.

At `/dev/real`, we reject this cycle. We believe the future doesn’t lie
in ever more complex interfaces, but in returning to something older
(and better) speech and text as the primary mode of interaction with
machines.

Rooted in the Unix philosophy, `/dev/real` wants to promote tools that
are minimal and composable. Our aim is to invent modern, efficient
workflows that live in the terminal: fast, scriptable, transparent, and
distraction-free.

No layers you didn’t ask for. No surprises. Just real tools for real work.

Check out [Style Guide](/style) for more.

## Command line tools

Clock utilities.

- [alarm-clock](https://github.com/harkaitz/sh-alarm-clock):
  Alarm clock for cron, uses beep to wake you up.
- [stopclock](https://github.com/harkaitz/sh-stopclock):
  A command line stopwatch and time difference calculator.
- [punch](https://github.com/harkaitz/sh-punch):
  Track how much you worked, from the command line.
- [tzview](https://github.com/harkaitz/sh-tzview):
  Display in local time the moment in time in other timezones.
- [alert-scripts](https://github.com/harkaitz/sh-alert-scripts):
  Scripts for alerting the user, via [ntfy.sh](https://ntfy.sh) etc.

## Programming languages

- [The C programming language](https://dvikan.no/ntnu-studentserver/kompendier/c-programming-in-linux.pdf):
  Good for simple system programs and libraries.
- [The Go programming language](https://go.dev/):
  Good for complex system software, services and websites. It is statically typed and compiled, simple syntax.
- [POSIX Shell Language](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html):
  Good for simple system scripts and automation tasks.
- [Tcl/Tk](http://www.tcl-lang.org/):
  Good for simple GUI applications and system scripts.
- [Python](https://www.python.org/):
  Good for automation tasks, extensive third party libraries.
- [HTML/CSS/HTMX/Bootstrap](https://htmx.org/):
  For frontends you don't need more, use HTMX for dynamic content.

## Operating systems

- [Void Linux](https://voidlinux.org/):
  No systemd, simple and fast, rolling release.
- [Debian](https://www.debian.org/):
  Systemd, stable, good hardware support.
- [OpenBSD](https://www.openbsd.org/):
  Good for security, simplicity and stability. Less hardware support than Linux.

## Working environments

- [Bash/Korn shell terminal](https://github.com/ibara/oksh):
  Good immersive environment for programming and system administration. On Ms Windows
  use [busybox-w32](https://frippery.org/busybox/) instead.
- [XFCE](https://www.xfce.org/):
  Good for a simple and fast desktop environment.

## Text editors

- [GNU Emacs](https://www.gnu.org/software/emacs/):
  A good text editor.

## Web browsers

- [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/):
  An open source web browser, better than alternatives.

## Contributing

Check out our [style guide](/style) and [environment variables](/env). If your
program meets the criteria, or approaches it, make a MR to [here](https://github.com/openvirtus/devreal.org).

