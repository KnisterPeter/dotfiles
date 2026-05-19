#!/usr/bin/env bash

echo -n "Install n ... "

if ! which n > /dev/null 2>&1 ; then
    echo "not not found. Installing..."
    sudo npm install --global n
fi

echo "✔️"
