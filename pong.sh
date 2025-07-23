#!/usr/bin/env bash

# check if bash is used
[ -v 'BASH' ] || { printf %s\\n 'shell is not bash' >&2; exit 1; }
# check if sourced
[ "$0" != "${BASH_SOURCE[0]}" ] || { printf %s\\n 'source this script' ". \"$0\"" >&2; exit 1; }

# disable echo
stty -echo
# reenable echo on Ctr-C
trap 'stty echo; trap - INT; (exit 130)' INT

# bind key sequence to the function name with return (this executes the function)
# to the terminal escape sequence response.
bind "\"\\e[0n\": \"main\\n\""

main(){
  # alternate
  ((i)) && { i=0; a=i; } || { i=1; a=o; }
  # actual output
  echo "p${a}ng"
  # trigger the terminal to send an escape sequence response
  printf "\\e[5n"
  # with a small pause, the shell terminal interaction becomes interruptable with Ctr-C
  sleep .15
}

# start it
main
