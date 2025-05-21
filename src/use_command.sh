## echo "# This file is located at 'src/use_command.sh'."
## echo "# It contains the implementation for the 'neovim-manager use' command."
## echo "# The code you write here will be wrapped by a function named 'neovim_manager_use_command()'."
## echo "# Feel free to edit this file; your changes will persist when regenerating."
## inspect_args

build=${args[build]}

if [[ "$build" == "none" ]]; then
  if [[ -L "$active" ]]; then
    rm "$active"
  fi
  return 0
fi

location="$share/nvim-$build"

if [[ ! -d "$location" ]]; then
  echo "Error: nvim-$build is not installed"
  if confirm "Would you like to install nvim-$build?"; then
    notify
    add_gap=1 "$0" install "$build"
  else
    return 1
  fi
fi

ln -sfn "$location" "$active"

notify "Using nvim-$build"
