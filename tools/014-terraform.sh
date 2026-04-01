#!/usr/bin/env bash

echo -n "  🔹 Terraform"

if which terraform > /dev/null ; then
    complete -C /usr/bin/terraform terraform
fi

echo ""
