#!/usr/bin/env bash

DENO_INSTALL="$HOME/.deno"
if [ -d "$DENO_INSTALL" ] ; then
    echo -n "  🔹 Deno"

    export DENO_INSTALL
    export PATH="$DENO_INSTALL/bin:$PATH"

    if which deno > /dev/null ; then
        # shellcheck disable=SC1090
        source <(deno completions bash)
    fi

    echo ""
fi
