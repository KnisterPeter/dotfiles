#!/usr/bin/env bash

echo -n "  🔹 GPG"

if [ -z "$GPG_TTY" ] ; then
    GPG_TTY=$(tty); export GPG_TTY
fi

echo ""
