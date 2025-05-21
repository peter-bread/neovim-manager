% neovim-manager-install(1) | Install a Neovim build
% 
% May 2025

NAME
==================================================

**neovim-manager install** - Install a Neovim build

SYNOPSIS
==================================================

**neovim-manager install** [BUILD] [OPTIONS]

DESCRIPTION
==================================================

Install a Neovim build

- Alias: **i**

ARGUMENTS
==================================================

BUILD
--------------------------------------------------



- Default Value: **stable**
- Allowed Values: **stable, nightly, all**

OPTIONS
==================================================

--quiet, -q
--------------------------------------------------

Suppress non-error output


DEPENDENCIES
==================================================

wget, curl
--------------------------------------------------

Install 'wget' or 'curl' via system package manager


tar
--------------------------------------------------

Install 'tar' via system package manager


EXAMPLES
==================================================

~~~
neovim-manager i

neovim manager install nightly

~~~

SEE ALSO
==================================================

**neovim-manager**(1)


