#!/usr/bin/env bash

if [ -z "$GPG_TTY" ] ; then
    echo -n "  🔹 GPG"

    GPG_TTY=$(tty); export GPG_TTY

    echo ""
fi
