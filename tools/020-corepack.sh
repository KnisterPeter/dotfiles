#!/usr/bin/env bash

if which corepack > /dev/null ; then
    echo -n "  🔹 corepack"

    corepack enable

    echo ""
fi
