#!/usr/bin/env bash

echo -n "Setup Flutter ..."

if which flutter > /dev/null ; then
    # shellcheck disable=SC1090
    . <(flutter bash-completion)
fi

echo "✔️"
