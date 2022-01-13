#!/usr/bin/env bash

if which flutter > /dev/null ; then
    # shellcheck disable=SC1090
    . <(flutter bash-completion)
fi
