#!/usr/bin/env bash

if which terraform > /dev/null ; then
    echo -n "  🔹 Terraform"

    complete -C /usr/bin/terraform terraform

    echo ""
fi
