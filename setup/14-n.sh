#!/usr/bin/env bash

if ! which n 2> /dev/null ; then
    echo "not not found. Installing..."
    volta install n
fi
