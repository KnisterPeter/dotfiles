#!/usr/bin/env bash

if ! which curl > /dev/null; then
    echo "Missing curl."
    exit 1
fi

if ! which unzip > /dev/null; then
    echo "Missing unzip."
    exit 1
fi

if ! which gpg > /dev/null; then
    echo "Missing gpg."
    exit 1
fi
