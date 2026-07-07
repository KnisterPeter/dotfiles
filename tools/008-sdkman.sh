#!/usr/bin/env bash

SDKMAN_DIR="$HOME/.sdkman"
if [ -d "$SDKMAN_DIR" ] ; then
    echo -n "  🔹 SDKMan"

    export SDKMAN_DIR
    # shellcheck disable=SC1091
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

    echo ""
fi
