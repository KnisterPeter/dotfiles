#!/usr/bin/env bash

if [ -z "$INSIDE_WSL" ]; then
    if [ -z "$SSH_AGENT_PID" ]; then
        eval "$(ssh-agent)" > /dev/null
    fi
fi
