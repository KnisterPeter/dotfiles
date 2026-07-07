#!/usr/bin/env bash

if [ -d "$HOME/.opencode" ] && which opencode > /dev/null ; then
    echo -n "  🔹 opencode"

    export PATH="$PATH:$HOME/.opencode/bin"

    echo ""
fi
