#!/usr/bin/env bash

echo -n "Install Node.js ... "

if ! volta list --quiet | grep -i "node" > /dev/null 2>&1 ; then
  volta install --quiet node
fi
if ! volta list --quiet | grep -i "npm" > /dev/null 2>&1 ; then
  volta install --quiet npm
fi

echo "✔️"
