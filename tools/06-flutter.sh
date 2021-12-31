#!/usr/bin/env bash

if which volta > /dev/null ; then
    # shellcheck disable=SC1090
    . <(flutter bash-completion)
fi
