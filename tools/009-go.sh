#!/usr/bin/env bash

echo -n "  🔹 go"

# shellcheck disable=SC2155
declare -r go_pkg="$(dpkg --list 'golang-[.0-9]*-go' | grep -e '^ii' | cut -d " " -f 3 | head -n 1)"
if [[ -n "${go_pkg}" ]] ; then
    GO_BIN="$(dpkg --listfiles "${go_pkg}" | grep -e "/bin$")"
    if [[ $PATH != *"$GO_BIN"* ]] ; then
        PATH="$PATH:$GO_BIN"
    fi

    if [[ -d "$HOME/go/bin" ]] && [[ $PATH != *"$HOME/go/bin"* ]] ; then
        PATH="$PATH:$HOME/go/bin"
    fi
else
    echo -n " - failed"
fi

echo ""
