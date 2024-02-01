#!/usr/bin/env bash

create_1password_session() {
    if [ -z "$OP_SESSION_my" ] ; then
        if [ ! -f /tmp/email ] ; then
            read -p "Enter your 1Password username: " email
            echo "$email" > /tmp/email
            eval "$(/tmp/op signin my "$email")"
        else
            eval "$(/tmp/op signin my)"
        fi
    fi
}

if [ "$INSTALL_SECRETS" != "false" ] ; then
    echo -n "Install 1Password Secrets ... "

    if [ ! -f "$HOME/.ssh/id_rsa" ] ; then
        create_1password_session
        mkdir -p "$HOME/.ssh"
        /tmp/op get document "SSH Key" --vault "Device Setup" --output "$HOME/.ssh/id_rsa"
    fi

    email=$(cat /tmp/email)
    if ! gpg --list-keys "$email" >/dev/null ; then
        create_1password_session
        /tmp/op get document "GPG Key" --vault "Device Setup" --output /tmp/gpg-key
        gpg --import /tmp/gpg-key
        rm /tmp/gpg-key
    fi

    echo "✔️"
fi

