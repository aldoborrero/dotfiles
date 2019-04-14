#!/usr/bin/env bash

VERSION='1.0.0'

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# usage - prints the help for this command
usage() {
  echo ""
  echo "dotfiles"
  echo ""
  echo "Find more information at: https://github.com/aldoborrero/dotfiles"
  echo ""
  echo "Usage:"
  echo "  ethvm [COMMAND] [ARGS...]"
  echo ""
  echo "Commands:"
  echo "  setup                            Setup and installs dotfiles to current system."
  echo "  setup-i3                         Setups and installs i3 into current system."
  echo "  help                             Print version information and exit."
  echo ""
}

# parse_args - parse positional args needed by some commands
parse_args() {
  # positional args
  args=()

  # named args
  while [[ "$1" != "" ]]; do
    case "$1" in
      * ) args+=("$1")       # if no match, add it to the positional args
    esac
    shift # move to next kv pair
  done

  # restore positional args
  set -- "${args[@]}"

  # set positionals to vars
  command="${args[0]:-false}"
  action="${args[1]}"
  subaction="${args[2]}"
}

# run - execute main script
run() {
  parse_args "$@"
  case ${command} in
    setup)           ${SCRIPT_DIR}/install.sh    ;;
    setup-i3)        ${SCRIPT_DIR}/install_s3.sh ;;
    help|*)          usage; exit 0               ;;
  esac
}
run "$@"
