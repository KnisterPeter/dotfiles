#!/usr/bin/env bash

if [ -d "$HOME/.bun" ] && [ "$(echo "$PATH" | grep -cm1 "$HOME/.bun")" -eq 0 ] ; then
    echo -n "  🔹 ~/.bun"

    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"

    echo ""
fi
