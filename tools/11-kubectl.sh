#!/usr/bin/env bash

echo -n "  🔹 kubectl (lazy)"

setup-kubectl() {
    if which kubectl > /dev/null ; then
        # shellcheck disable=SC1090
        source <(kubectl completion bash)
    fi
}

echo ""
