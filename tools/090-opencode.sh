#!/usr/bin/env bash

echo -n "  🔹 Opencode"

if [ -d "$HOME/.opencode" ] ; then
    export PATH="$PATH:$HOME/.opencode/bin"
fi

echo ""
