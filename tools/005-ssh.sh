#!/usr/bin/env bash

echo -n "  🔹 SSH"

if [ -n "$INSIDE_WSL" ]; then
    if ssh-add.exe -l > /dev/null 2>&1 ; then
        echo -n " - from Windows 1Password agent"
    else
        if [ -z "$SSH_AGENT_PID" ]; then
            echo -n " - starting new agent"
            eval "$(ssh-agent)" > /dev/null
        fi
    fi
fi

echo ""
