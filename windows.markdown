---
layout: page
title: Busybox + OpenSSH + Windows
---

MS Windows is not a great operating system for development, but it is
ubiquitous. It is possible to transform it into a decent development
environment.

The biggest problem with Windows is the lack of a decent shell and
command line tools. `Cygwin` is an option, but it tries to be a full
POSIX emulation layer, which is overkill for most users and causes
compatibility issues with native Windows applications. `MSYS2` is
another option, but it is also a large distribution and not very
portable.

The best option is to use `busybox-w32`, a minimal set of command line
tools compiled for Windows in a single executable. It provides a
POSIX-like shell and numerous common utilities.

## Installing Busybox and OpenSSH

### Step 1: Install Busybox-w32

Download the [busybox-w32](https://frippery.org/busybox/) and install
it in `C:\Windows\System32` with the following names:

- `sh.exe` : The shell.
- `lash.exe` : The shell with `-l` option enabled.

### Step 2: Install OpenSSH and make it work with Busybox

Install OpenSSH Server.

    Settings > System > Optional Features
    ->[View features]
    ->[Type OpenSSH]
    ->[Install OpenSSH]

Configure the service, initialize `ProgramData` settings.

    [Windows]->[Services (Run as administrator)]
    - Scroll to "OpenSSH SSH Server".
    - Startup type: Automatic.
    - Click recovery: Restart in 5 minutes.
    - Start service.

Edit configuration.

    - Open CMD as administrator.
    - > cd C:\ProgramData\ssh
    - > notepad sshd_config
    - Uncomment: PubkeyAuthentication yes
    - Uncomment: StrickModes no
    - Comment: Just at the botton, "Match Group administrators" AuthorizedKeysFile section.

Set busybox as the default shell.

    - Open powershell.
    - $ New-ItemProperty -Path "HKLM:\SOFTWARE\OpenSSH" -Name DefaultShell -Value "C:\Windows\System32\lash.exe" -PropertyType String -Force

### Step 3: Install other useful tools

Search programs with "w" in the [program list](/), install the binaries
in `$LOCALAPPDATA\Microsoft\WindowsApps`, it is already in your PATH.

## Windows only software.

Desktop:

- [`open-shell`](https://github.com/Open-Shell/Open-Shell-Menu) _(gw-)_ : Better start menu.
- [`vcxsrv`](https://sourceforge.net/projects/vcxsrv) _(gw-)_ : X11 Server.

Automation tools:

- [`nircmd`](https://www.nirsoft.net/utils/nircmd.html) _(tw-)_ : Windows automation tool.

Corporate nonsense management:

- [`keep-alive`](https://github.com/stigoleg/keep-alive) _(twp)_ : Prevent your system from going to sleep.
