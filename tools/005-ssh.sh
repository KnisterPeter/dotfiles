#!/usr/bin/env bash

if [ -n "$INSIDE_WSL" ]; then
    echo -n "  🔹 SSH"

    if ssh-add.exe -l > /dev/null 2>&1 ; then
        echo -n " - from Windows 1Password agent"
    else
        if [ -z "$SSH_AGENT_PID" ]; then
            echo -n " - starting new agent"
            eval "$(ssh-agent)" > /dev/null
        fi
    fi

    echo ""
fi
