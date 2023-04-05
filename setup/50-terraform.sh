#!/usr/bin/env bash

if ! which terraform 2> /dev/null ; then
    if which apt 2> /dev/null ; then
        echo "About to install system dependencies"

        sudo apt-get update
        sudo apt-get install -y gnupg software-properties-common
        wget -O- https://apt.releases.hashicorp.com/gpg | \
            gpg --dearmor | \
            sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
            https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
            sudo tee /etc/apt/sources.list.d/hashicorp.list
        sudo apt update
        sudo apt-get install terraform
    else
        echo "Unknown system"
        exit 1
    fi
fi
