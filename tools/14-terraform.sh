#!/usr/bin/env bash

if which terraform > /dev/null ; then
    complete -C /usr/bin/terraform terraform
fi
