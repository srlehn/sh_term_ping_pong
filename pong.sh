#!/usr/bin/env bash

# check if bash is used
[ -v 'BASH' ] || { printf %s\\n 'shell is not bash' >&2; exit 1; }
# check if sourced
[ "$0" != "${BASH_SOURCE[0]}" ] || { printf %s\\n 'source this script' ". \"$0\"" >&2; exit 1; }

stty -echo
alias t='((i)) && { i=0; a=i; } || { i=1; a=o; }; echo "p${a}ng"; bind "\"\\e[0n\": \"t\\n\""; printf "\\e[5n"'
t
