#!/usr/bin/env bash

echo -n "Prepare OS packages ... "

to_install=
if ! which curl > /dev/null 2>&1; then
    echo "Missing curl."
    to_install="$to_install curl"
fi

if ! which zip > /dev/null 2>&1; then
    echo "Missing zip."
    to_install="$to_install zip"
fi

if ! which unzip > /dev/null 2>&1; then
    echo "Missing unzip."
    to_install="$to_install unzip"
fi

if ! which gpg > /dev/null 2>&1; then
    echo "Missing gpg."
    to_install="$to_install gpg"
fi

if ! which sudo > /dev/null 2>&1; then
    echo "Missing sudo."
    to_install="$to_install sudo"
fi

if [ ! -f /etc/bash_completion ] ; then
    echo "Missing bash-completion."
    to_install="$to_install bash-completion"
fi

if ! which fzf > /dev/null 2>&1; then
    echo "Missing fzf."
    to_install="$to_install fzf"
fi

if ! which direnv > /dev/null 2>&1; then
    echo "Missing direnv."
    to_install="$to_install direnv"
fi

if [ ! -f /usr/lib/go-1.19/bin/go ] ; then
    echo "Missing go."
    to_install="$to_install golang-1.19-go"
fi
export PATH="$PATH:/usr/lib/go-1.19/bin"

if [ -n "$to_install" ] ; then
    if which apt > /dev/null 2>&1 ; then
        sudo apt update
        # shellcheck disable=SC2086
        sudo apt install -yy $to_install
    elif which dnf > /dev/null 2>&1 ; then
        # shellcheck disable=SC2086
        sudo dnf install -y $to_install
    else
        echo "Unknown system"
        exit 1
    fi
fi

if [ ! -e "$HOME/.gitconfig.local" ] ; then
    touch "$HOME/.gitconfig.local"
fi

echo "✔️"
