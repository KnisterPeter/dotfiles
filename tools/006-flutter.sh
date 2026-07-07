#!/usr/bin/env bash

if [ -d "$HOME/Downloads/flutter" ] ; then
    echo -n "  🔹 Flutter"

    export PATH="$HOME/Downloads/flutter/bin/:$PATH"

    if which flutter > /dev/null ; then
        # shellcheck disable=SC1090
        . <(flutter bash-completion)
    fi

    echo ""
fi
