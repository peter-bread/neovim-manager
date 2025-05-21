## echo "# This file is located at 'src/self_destruct_command.sh'."
## echo "# It contains the implementation for the 'neovim-manager self-destruct' command."
## echo "# The code you write here will be wrapped by a function named 'neovim_manager_self_destruct_command()'."
## echo "# Feel free to edit this file; your changes will persist when regenerating."

## inspect_args

yes=${args[--yes]:-0}
dry_run=${args[--dry-run]:-0}

if ! [[ "$(command -v -- "$0")" == /* ]]; then
  echo "Error: cannot delete local development script"
  return 1
fi

function self_destruct() {
  "$0" uninstall all
  rmdir "$share"
  rm -- "$0"
}

function self_destruct_dry_run() {
  echo "$0 uninstall all"
  echo "rmdir $share"
  echo "rm -- $0"
}

function maybe_self_destruct() {
  if [[ "$dry_run" -eq 1 ]]; then
    self_destruct_dry_run
  else
    self_destruct
  fi
}

if [[ "$yes" -eq 1 ]]; then
  maybe_self_destruct
else
  if confirm "Are you sure you want to uninstall neovim-manager?"; then
    maybe_self_destruct
  else
    return 1
  fi
fi

