#!/usr/bin/env bash

echo -n "Setup Terraform ..."

if which terraform > /dev/null ; then
    complete -C /usr/bin/terraform terraform
fi

echo "✔️"
