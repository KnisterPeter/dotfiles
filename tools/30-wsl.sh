#!/usr/bin/env bash

if [ -n "$INSIDE_WSL" ]; then
    echo -n "Setup WSL ... "

    # Adding wsl-open as a browser for Bash for Windows
    if [[ -z $BROWSER ]]; then
        export BROWSER=wsl-open
    else
        export BROWSER=$BROWSER:wsl-open
    fi

    # enable windows ssh for git usage
    # They can access the windows ssh-agent and
    # use the windows ssh config
    git config --global core.sshCommand ssh.exe
    alias ssh='ssh.exe'
    alias ssh-add='ssh-add.exe'
    
    ## shellcheck disable=SC1091
    #source "$HOME/.agent-bridge.sh"

    echo "✔️"
fi
