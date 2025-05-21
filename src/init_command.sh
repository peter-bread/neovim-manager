## echo "# This file is located at 'src/init_command.sh'."
## echo "# It contains the implementation for the 'neovim-manager init' command."
## echo "# The code you write here will be wrapped by a function named 'neovim_manager_init_command()'."
## echo "# Feel free to edit this file; your changes will persist when regenerating."
## inspect_args

if ! [[ ":$PATH:" == *":${XDG_DATA_HOME:-$HOME/.local/share}/neovim-manager/builds/active/bin:"* ]]; then
  echo 'export PATH="${XDG_DATA_HOME:-$HOME/.local/share}/neovim-manager/builds/active/bin:$PATH"'
fi
