#!/usr/bin/env bash

if ! which deno 2> /dev/null ; then
    echo "Deno not found. Installing..."
    curl -fsSL https://deno.land/x/install/install.sh | sh
fi