#!/usr/bin/env bash

echo -n "Setup SDKMan ..."

if which node > /dev/null ; then
    export SDKMAN_DIR="$HOME/.sdkman"
    # shellcheck disable=SC1091
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

echo "✔️"
