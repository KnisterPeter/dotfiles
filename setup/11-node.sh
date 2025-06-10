#!/usr/bin/env bash

echo -n "Install Node.js ... "

if ! n ls | grep -i "node" > /dev/null 2>&1 ; then
  n lts > /dev/null 2>&1
fi

echo "✔️"
