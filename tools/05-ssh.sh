#!/usr/bin/env bash

if [ -z "$INSIDE_WSL" ]; then
    if [ -S "$HOME/.1password/agent.sock" ] ;then
        export SSH_AUTH_SOCK=~/.1password/agent.sock
    else
        if [ -z "$SSH_AGENT_PID" ]; then
            eval "$(ssh-agent)" > /dev/null
        fi
    fi
fi
