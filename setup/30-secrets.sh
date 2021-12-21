#!/usr/bin/env bash

if [ ! -f "$HOME/.ssh/id_rsa" ] ; then
    mkdir -p "$HOME/.ssh"
    /tmp/op get document "SSH Key" --vault "Device Setup" --output "$HOME/.ssh/id_rsa"
fi

email=$(cat /tmp/email)
if ! gpg --list-keys "$email" >/dev/null ; then
    /tmp/op get document "GPG Key" --vault "Device Setup" --output /tmp/gpg-key
    gpg --import /tmp/gpg-key
    rm /tmp/gpg-key
fi
