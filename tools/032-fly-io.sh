#!/usr/bin/env bash

if [ -d "$HOME/.fly" ] ; then
    echo -n "  🔹 Fly.io CLI"

    export FLYCTL_INSTALL="$HOME/.fly"
    export PATH="$FLYCTL_INSTALL/bin:$PATH"

    if which flyctl > /dev/null ; then
        # shellcheck disable=SC1090
        source <(flyctl completion bash)
    fi

    echo ""
fi
