#!/usr/bin/env bash

if [ -d "$HOME/.opencode" ] ; then
    echo -n "  🔹 opencode"

    export PATH="$PATH:$HOME/.opencode/bin"

    echo ""
fi
