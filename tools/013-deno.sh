#!/usr/bin/env bash

echo -n "  🔹 Deno"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

if which deno > /dev/null ; then
    # shellcheck disable=SC1090
    source <(deno completions bash)
fi

echo ""
