#!/usr/bin/env bash

echo -n "  🔹 corepack"

if which corepack > /dev/null ; then
    echo -n " (enable)"
    corepack enable
fi

echo ""
