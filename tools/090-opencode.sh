#!/usr/bin/env bash

if [ -d "$HOME/.opencode" ] ; then
    echo -n "  🔹 opencode"

    if [[ $PATH != *"opencode"* ]]; then
        export PATH="$PATH:$HOME/.opencode/bin"
    fi

    echo ""
fi
