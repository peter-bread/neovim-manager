## echo "# This file is located at 'src/install_command.sh'."
## echo "# It contains the implementation for the 'neovim-manager install' command."
## echo "# The code you write here will be wrapped by a function named 'neovim_manager_install_command()'."
## echo "# Feel free to edit this file; your changes will persist when regenerating."
## inspect_args

# system info
os="$(get_os)"
arch="$(get_arch)"

# URL to fetch tarballs
github_url="https://github.com/neovim/neovim/releases/download"

build=${args[build]}
quiet=${args[--quiet]:-0} # this is used by the `notify` function

if [[ "$build" == "all" ]]; then
  extra_args=()
  [[ "$quiet" == "1" ]] && extra_args+=(--quiet) # make sure --quiet persists
  add_gap=1 "$0" install stable "${extra_args[@]}"
  "$0" install nightly "${extra_args[@]}"
  return 0
fi

format="tar.gz"
name="nvim-$os-$arch"
archive="$name.$format"
http_link="$github_url/$build/$archive"
location="$share/nvim-$build"

http_client=${deps[http_client]}

cd "$HOME"

notify "== Installing latest $build build of Neovim =="

notify "Fetching $http_link"

case "$http_client" in
  *wget) http_args="--quiet" ;;
  *curl) http_args="-sO" ;;
esac

"$http_client" "$http_args" "$http_link"

notify "Extracting $archive"

tar xzf "$archive" &>/dev/null

mkdir -p "$share"

[[ -d "$location" ]] && rm -r "$location"

notify "Moving $name to $location"

mv "$name" "$location"

notify "Deleting $archive"

rm "$archive"

if [[ "${add_gap:-0}" -eq 1 ]]; then
  notify
fi
