#!/usr/bin/env bash

echo -n "  🔹 Node.js"

version="$(node -v 2> /dev/null)"
echo -n " (${version})"

if [[ -n "${version}" ]] ; then
    # shellcheck disable=SC1090
    source <(node --completion-bash)
fi

echo ""
