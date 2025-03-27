# neovim-manager

Simple CLI tool to install and switch between latest stable and nighly
builds of Neovim.

## Install

Download the script and make sure it is available in `PATH`.

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
