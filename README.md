# neovim-manager

Simple CLI tool to install and switch between latest stable and nightly
builds of Neovim.

> [!NOTE]
> Intended for use on Unix-like systems.

## Requirements

- `bash` 4.0 or higher
- `wget`/`curl`
- `tar`

## Install

> [!TIP]
> Always check scripts before running them.
> See [here](https://raw.githubusercontent.com/peter-bread/neovim-manager/refs/heads/main/scripts/install)
> to see the installation script for this software.

Installation of script and manpages to `$HOME/.local/bin` and
`$HOME/.local/share/man` respectively. (no `sudo`):

```sh
curl -fsSL https://raw.githubusercontent.com/peter-bread/neovim-manager/refs/heads/main/scripts/install | bash
```

```sh
wget -qO- https://raw.githubusercontent.com/peter-bread/neovim-manager/refs/heads/main/scripts/install | bash
```

### Options

Set these variables to anything non-zero to enable them:

- `MINIMAL`: only install script; no manpages
- `SYSTEM_WIDE`: install to `/usr/local/bin` and `/usr/share/man` (needs `sudo`)

```sh
MINIMAL=1 SYSTEM_WIDE=1 bash <(curl -fsSL https://raw.githubusercontent.com/peter-bread/neovim-manager/refs/heads/main/scripts/install)
```

```sh
MINIMAL=1 SYSTEM_WIDE=1 bash <(wget -qO- https://raw.githubusercontent.com/peter-bread/neovim-manager/refs/heads/main/scripts/install)
```

## Usage

Initialise in shell. Add the following to your shell rc file:

```sh
eval "$(neovim-manager init)"
```

Install (or update):

```sh
neovim-manager install stable
```

Use:

```sh
neovim-manager use stable
```

Uninstall:

```sh
neovim-manager uninstall stable
```

## Uninstall

Run:

```sh
neovim-manager self-destruct
```

## Under the Hood

`neovim-manager` fetches tarballs from the Neovim GitHub releases page. These are
then extracted and stored locally. It will first attempt to store these in
`$XDG_DATA_HOME/neovim-manager/`, but if that environment variable is not set
than it will fall back to `$HOME/.local/share/neovim-manager/`.
