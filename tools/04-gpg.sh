#!/usr/bin/env bash

echo -n "Setup GPG ..."

if [ -z "$GPG_TTY" ] ; then
    GPG_TTY=$(tty); export GPG_TTY
fi

echo "✔️"
