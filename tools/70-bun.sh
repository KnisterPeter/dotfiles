#!/usr/bin/env bash

echo -n "  🔹 ~/.bun"

if [ -d "$HOME/.bun" ] && [ "$(echo "$PATH" | grep -cm1 "$HOME/.bun")" -eq 0 ] ; then
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

echo ""
