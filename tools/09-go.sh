#!/usr/bin/env bash

if ! which go 2> /dev/null; then
#if [ "$PATH" != "*go-1.19/bin*" ] ; then
    PATH="$PATH:/usr/lib/go-1.19/bin/"
fi
