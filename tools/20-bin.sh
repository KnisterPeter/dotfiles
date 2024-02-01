#!/usr/bin/env bash

echo -n "  🔹 ~/bin"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] && [ "$(echo "$PATH" | grep -cm1 "$HOME/bin")" -eq 0 ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] && [ "$(echo "$PATH" | grep -cm1 "$HOME/.local/bin")" -eq 0 ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

echo ""
