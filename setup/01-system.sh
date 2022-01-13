#!/usr/bin/env bash

to_install=
if ! which curl > /dev/null; then
    echo "Missing curl."
    to_install="$to_install curl"
fi

if ! which unzip > /dev/null; then
    echo "Missing unzip."
    to_install="$to_install unzip"
fi

if ! which gpg > /dev/null; then
    echo "Missing gpg."
    to_install="$to_install gpg"
fi

if ! which sudo > /dev/null; then
    echo "Missing sudo."
    to_install="$to_install sudo"
fi

if [ ! -f /etc/bash_completion ] ; then
    echo "Missing bash-completion."
    to_install="$to_install bash-completion"
fi

if ! which fzf > /dev/null; then
    echo "Missing fzf."
    to_install="$to_install fzf"
fi

if [ -n "$to_install" ] ; then
    sudo apt update
    sudo apt install -yy $to_install
fi
