#!/usr/bin/env bash

echo -n "Setup Node.js ..."

if which node > /dev/null ; then
    # shellcheck disable=SC1090
    source <(node --completion-bash)
fi

echo "✔️"
