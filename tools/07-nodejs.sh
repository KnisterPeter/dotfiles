#!/usr/bin/env bash

if which node > /dev/null ; then
    # shellcheck disable=SC1090
    source <(node --completion-bash)
fi
