#!/usr/bin/env bash

echo -n "  🔹 go"

if ! which go > /dev/null 2>&1; then
#if [ "$PATH" != "*go-1.19/bin*" ] ; then
    PATH="$PATH:/usr/lib/go-1.19/bin/"
fi

echo ""
