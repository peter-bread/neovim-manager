# neovim-manager

Simple CLI tool to install and switch between latest stable and nighly
builds of Neovim.

> [!NOTE]
> Intended for use on Unix-like systems.

## Install

Download the script and make sure it is available in `PATH`.

```sh
wget https://raw.githubusercontent.com/peter-bread/neovim-manager/refs/heads/main/neovim-manager
```

Common locations:

```sh
mv neovim-manager ~/.local/bin
```

```sh
sudo mv neovim-manager /usr/local/bin
```

## Usage

Initialise in shell. Add the following to your shell rc file:

```sh
eval "$(neovim-manager init)"
```

Install:

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

Simply delete the script.

## Under the Hood

`neovim-manager` fetches tarballs from the Neovim GitHub releases page. These are
then extracted and stored locally. It will first attempt to store these in
`$XDG_DATA_HOME/neovim-manager/`, but if that environment variable is not set
than it will fall back to `$HOME/.local/share/neovim-manager/`.
