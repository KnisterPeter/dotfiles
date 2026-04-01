#!/usr/bin/env bash

if [ -n "$INSIDE_WSL" ]; then
    echo -n "  🔹 WSL"

    # Adding wsl-open as a browser for Bash for Windows
    export BROWSER=wsl-open

    # enable windows ssh for git usage
    # They can access the windows ssh-agent and
    # use the windows ssh config
    alias ssh='ssh.exe'
    alias ssh-add='ssh-add.exe'
    
    ## shellcheck disable=SC1091
    #source "$HOME/.agent-bridge.sh"

    echo ""
fi
