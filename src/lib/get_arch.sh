## Add any function here that is needed in more than one parts of your
## application, or that you otherwise wish to extract from the main function
## scripts.
##
## Note that code here should be wrapped inside bash functions, and it is
## recommended to have a separate file for each function.
##
## Subdirectories will also be scanned for *.sh, so you have no reason not
## to organize your code neatly.
##

# usage: arch="$(get_arch)"
function get_arch() {
  local temp
  temp=$(uname -m)

  case "$temp" in
    x86_64 | arm64)
      echo "$temp"
      return 0
      ;;
    *)
      echo "unknown or not supported" >&2
      return 1
      ;;
  esac
}
