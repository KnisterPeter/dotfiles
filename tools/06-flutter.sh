#!/usr/bin/env bash

echo -n "  🔹 Flutter (lazy)"

setup-flutter() {
    if which flutter > /dev/null ; then
        # shellcheck disable=SC1090
        . <(flutter bash-completion)
    fi
}

echo ""
