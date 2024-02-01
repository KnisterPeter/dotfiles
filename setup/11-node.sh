#!/usr/bin/env bash

echo -n "Install Node.js ... "

if ! which node > /dev/null 2>&1 ; then
  volta install --quiet node
fi
if ! which npm > /dev/null 2>&1 ; then
  volta install --quiet npm
fi

echo "✔️"
