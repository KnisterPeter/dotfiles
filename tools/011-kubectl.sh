#!/usr/bin/env bash

setup-kubectl() {
    if which kubectl > /dev/null ; then
        # shellcheck disable=SC1090
        source <(kubectl completion bash)
    fi
}
