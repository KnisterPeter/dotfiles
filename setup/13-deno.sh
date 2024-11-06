#!/usr/bin/env bash

echo -n "Install Deno ... "

if ! which deno > /dev/null 2>&1 ; then
    echo "Deno not found. Installing..."
    curl -fsSL https://deno.land/install.sh | sh
fi

echo "✔️"
