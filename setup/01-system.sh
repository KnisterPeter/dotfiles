#!/usr/bin/env bash

to_install=
if ! which curl 2> /dev/null; then
    echo "Missing curl."
    to_install="$to_install curl"
fi

if ! which unzip 2> /dev/null; then
    echo "Missing unzip."
    to_install="$to_install unzip"
fi

if ! which gpg 2> /dev/null; then
    echo "Missing gpg."
    to_install="$to_install gpg"
fi

if ! which sudo 2> /dev/null; then
    echo "Missing sudo."
    to_install="$to_install sudo"
fi

if [ ! -f /etc/bash_completion ] ; then
    echo "Missing bash-completion."
    to_install="$to_install bash-completion"
fi

if ! which fzf 2> /dev/null; then
    echo "Missing fzf."
    to_install="$to_install fzf"
fi

if [ -n "$to_install" ] ; then
    if which apt 2> /dev/null ; then
        sudo apt update
        # shellcheck disable=SC2086
        sudo apt install -yy $to_install
    elif which dnf 2> /dev/null ; then
        # shellcheck disable=SC2086
        sudo dnf install -y $to_install
    else
        echo "Unknown system"
        exit 1
    fi
fi

