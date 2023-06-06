#!/usr/bin/env bash

to_install=
if ! which curl 2> /dev/null; then
    echo "Missing curl."
    to_install="$to_install curl"
fi

if ! which zip 2> /dev/null; then
    echo "Missing zip."
    to_install="$to_install zip"
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

if ! which direnv 2> /dev/null; then
    echo "Missing direnv."
    to_install="$to_install direnv"
fi

if [ ! -f /usr/lib/go-1.19/bin/go ] ; then
    echo "Missing go."
    to_install="$to_install golang-1.19-go"
fi
export PATH="$PATH:/usr/lib/go-1.19/bin"

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

