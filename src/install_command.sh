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

if [[ "$build" == "all" ]]; then
  "$0" install stable
  "$0" install nightly
  return 0
fi

format="tar.gz"
name="nvim-$os-$arch"
archive="$name.$format"
location="$share/nvim-$build"

http_client=${deps[http_client]}

cd "$HOME"

case "$http_client" in
  *wget)
    "$http_client" --quiet "$github_url/$build/$archive"
    ;;
  *curl)
    "$http_client" -sO "$github_url/$build/$archive"
    ;;
esac

tar xzf "$archive" &>/dev/null

mkdir -p "$share"

[[ -d "$location" ]] && rm -r "$location"

mv "$name" "$location"

rm "$archive"
