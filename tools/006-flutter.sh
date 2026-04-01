#!/usr/bin/env bash

echo -n "  🔹 Flutter"

if [ -d "$HOME/Downloads/flutter" ] ; then
    export PATH="$HOME/Downloads/flutter/bin/:$PATH"
fi

if which flutter > /dev/null ; then
    # shellcheck disable=SC1090
    . <(flutter bash-completion)
fi

echo ""
