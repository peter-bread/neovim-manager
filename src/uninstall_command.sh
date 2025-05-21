# echo "# This file is located at 'src/uninstall_command.sh'."
# echo "# It contains the implementation for the 'neovim-manager uninstall' command."
# echo "# The code you write here will be wrapped by a function named 'neovim_manager_uninstall_command()'."
# echo "# Feel free to edit this file; your changes will persist when regenerating."
# inspect_args

build=${args[build]}
location="$share/nvim-$build"

if [[ -d "$location" ]]; then
  echo "Uninstalling nvim-$build"
  rm -r "$location"

  # assumes $active is a valid symlink
  # TODO: verify that it actually exists
  if [[ "$(readlink -f "$active")" == "$location" ]]; then
    echo "Unsetting active"
    rm "$active"
  fi

  return 0

else
  echo "nvim-$build not installed."
  return 1
fi
