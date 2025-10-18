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

A list of development tools [here](/devel).

Tag legend:

    (t|g w p|l)
     | | | '--- POSIX|Linux
     | | '--- Windows
     | '--- GUI
     '--- Terminal

## Operating systems

- [Void Linux](https://voidlinux.org/):
  No SystemD, simple and fast, rolling release.
- [Debian](https://www.debian.org/):
  SystemD, stable, good hardware support.
- [OpenBSD](https://www.openbsd.org/):
  Good for security, simplicity and stability. Less hardware support than Linux.
- [Busybox/Windows](/windows):
  It is possible to transform Windows into a decent development environment. Read
  this [guide](/windows).

## Desktops

Desktop environments:

- [XFCE](https://www.xfce.org/) _(g-p c,gtk)_:
  Good for a simple and fast desktop environment.

Remote desktops.

- [TigerVNC](https://tigervnc.org/) _(gwp c++)_: Remote desktop client and server.
- [X11VNC](https://github.com/LibVNC/x11vnc) _(g-p c)_ : VNC server.

## Shells and terminals

Shells:

- [Busybox shell (ash)](/notes#Busybox) _(twp c)_:
  A good minimal shell.

- [Korn shell terminal](https://github.com/ibara/oksh) _(t-p c)_:
  Good immersive environment for programming and system administration.

Terminals:

- [XTerm](/notes#xterm) _(g-p c)_ : The classic terminal emulator.

Remote access:

- [OpenSSH](https://www.openssh.com/) _(twp c)_  : Remote login client and tunnelling tool.

Terminal utilities and multiplexers

- [moor](https://github.com/walles/moor) _(twp go)_ : Good pager, an alternative to less.
- [tmux](https://github.com/tmux/tmux) _(t-p c)_ : Multiplexer.

## Text editors

- [GNU Emacs](https://www.gnu.org/software/emacs/) _(gwp c,elisp)_ :
  A good text editor.

## WWW (The World Wide Web)

Browsers:

- [Mozilla Firefox](https://www.mozilla.org/en-US/firefox/new/) _(gwp c++,gtk+)_:
  An open source web browser, better than alternatives.

The small web (gopher/gemini):

- [lagrange](https://github.com/skyjake/lagrange) _(gwp c)_ : Small gopher/gemini web browser.
- [amfora](https://github.com/makew0rld/amfora) _(twp go)_   : Gemini client for the terminal.

## Mail, chats and telephony

Mail:

- [Sylpheed](https://sylpheed.sraoss.jp/en/) _(gwp c++,gtk+)_ : Mail reader.

Chats:

- [telegram](https://telegram.org/?setln=es) _(gwp c++,qt)_ : Telegram WhatsApp alternative.
- [hexchat](https://hexchat.github.io/) _(gwp c,gtk)_ : IRC Client.

Telephony:

- [microsip](https://www.microsip.org/) _(gw- c++)_ : Good SIP phone. (works with wine)

## Office tasks

Text processors:

- [texmacs](https://www.texmacs.org/)  _(gwp c,guile)_ : Good WYSIWYG advanced text editor.
- [libreoffice](https://www.libreoffice.org/) _(gwp c++)_ : Office Suite.

Text processor Utilities:

- [pandoc](https://pandoc.org/) _(twp python)_ : Document converter.
- [hunspell](https://hunspell.github.io/) _(twp c++)_ : Spell checker.

PDF Readers:

- [sumatra](https://www.sumatrapdfreader.org/free-pdf-reader) _(gw- c++)_ : PDF Reader.

Shared directory.

- [rclone](https://rclone.org/) _(twp go)_ : Service directories with `HTTP/WebDAV/FTP/SFTP/DLNA`.
- [sshfs](https://github.com/libfuse/sshfs) _(twp c)_ : Mount OpenSSH directories.

## Finance and accounting

Accounting ledgers (ledger format):

- [hledger](https://hledger.org/) _(twp haskell)_ : Professional accounting.

Tickers:

- [coingecko](https://www.coingecko.com/) _(twp go)_ : Cryptocurrency tickers.
- [ticker](https://github.com/achannarasappa/ticker) _(twp go)_ : Stock market tickers.

## Multimedia

Music Collection:

- [mpd](https://www.musicpd.org/) _(twp c)_ : Music server.
- [mpc](https://www.musicpd.org/clients/mpc/) _(twp c)_ : Music terminal client.
- [ymuse](https://github.com/yktoo/ymuse) _(g-p go)_ : MPD GUI Client.
- [mpdctrl](https://github.com/torum/MPDCtrl) _(gw- c++)_ : MPD GUI Client.

Graphics:

- [gimp](https://www.gimp.org/) _(gwp c,gtk)_ : Image editor.
- [nomacs](https://nomacs.org/) _(gw- c++)_ : Image viewer.

## Time, weather, tides, ...

Clock utilities.

- [alarm-clock](https://github.com/harkaitz/sh-alarm-clock) _(twp sh)_ :
  Alarm clock for cron, uses beep to wake you up.
- [stopclock](https://github.com/harkaitz/sh-stopclock) _(twp sh)_ :
  A command line stopwatch and time difference calculator.
- [tzview](https://github.com/harkaitz/sh-tzview) _(twp sh)_ :
  Display in local time the moment in time in other timezones.

The sun.

- [daylight](https://github.com/jbreckmckye/daylight) _(twp go)_ : Track sunrise and sunset times.

Weather:

- [stormy](https://github.com/ashish0kumar/stormy) _(twp go)_ : Weather CLI like neofetch.
- [yr](https://git.sr.ht/~timharek/yr) _(twp go)_ : Weather forecast.

Tides:

- [wxtide32](http://svhorizon.com/wxtide32) _(gw-)_ : Tide prediction program. (works with wine)

## Archivers.

- [7z](https://www.7-zip.org/) _(twp c)_ : File archiver with a high compression ratio.

## System utilities

System information:

- [fastfetch](https://github.com/fastfetch-cli/fastfetch) _(twp go)_ : Display system information.
- [pciutils](/notes#pciutils) _(twp c)_ : List devices connected to the PCI bus.

Permission elevation:

- [elevate](https://code.kliu.org/misc/elevate) _(tw- c)_ : Execute programs elevated on Windows.
- [doas](https://github.com/slicer69/doas) _(t-p c)_ : Execute commands as another user.

Storage analysis:

- [windirstat](https://windirstat.net/) _(gw- c++)_ : Disk usage analyser.
- [gdu](https://github.com/dundee/gdu) _(twp go)_ : Disk usage analyser.

Wake-up:

- [wakey](https://github.com/jonathanruiz/wakey) _(twp go)_  : A TUI for waking your devices using Wake-on-LAN.

Package management:

- [pkgtop](https://github.com/orhun/pkgtop) _(t-l go)_ : Interactive package manager and resource monitor tool for GNU/Linux.

## Large Language Models

- [tgpt](https://github.com/aandrew-me/tgpt) _(twp go)_ : AI in your Terminal without API keys.
- [yai](https://github.com/ekkinox/yai) _(twp go)_ : AI powered terminal assistant.

## Spreadsheets (CSV)

- [sqly](https://github.com/nao1215/sqly) _(twp go)_ : Execute SQL against CSV, TSV, LTSV, and Microsoft Excel.
- [miller](https://github.com/johnkerl/miller) _(twp go)_ : Miller is like `awk/sed/cut/join`, for `CSV/TSV/JSON/JSON`.
- [textql](https://github.com/dinedal/textql) _(gwp go)_  : Execute SQL against structured text like CSV or TSV.
- [ttyplot](https://github.com/tenox7/ttyplot) _(twp c)_ : A real-time terminal plotting utility with data input from stdin.

## Contributing

Check out our [style guide](/style) and [environment variables](/env). If your
program meets the criteria, or approaches it, make a merge request to [here](https://github.com/openvirtus/devreal.org).

