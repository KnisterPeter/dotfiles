#!/usr/bin/env bash

echo -n "Prepare OS packages ... "

to_install=

for tool in curl zip unzip gpg sudo fzf direnv xauth ; do
    if ! which "$tool" > /dev/null 2>&1; then
        to_install="$to_install $tool"
    fi
done

if [ ! -f /etc/bash_completion ] ; then
    to_install="$to_install bash-completion"
fi

if [ ! -f /usr/lib/go-1.20/bin/go ] ; then
    to_install="$to_install golang-1.20-go"
fi
export PATH="$PATH:/usr/lib/go-1.20/bin"

if [ -n "$to_install" ] ; then
    echo "$to_install ... "
    echo
    echo "------------------------"
    echo

    if which apt-get > /dev/null 2>&1 ; then
        sudo apt-get -qq update
        # shellcheck disable=SC2086
        sudo apt-get -qq install -yy $to_install
    elif which dnf > /dev/null 2>&1 ; then
        # shellcheck disable=SC2086
        sudo dnf install -y $to_install
    else
        echo "Unknown system"
        exit 1
    fi

    echo
    echo "------------------------"
    echo
else
    echo "✔️"
fi

if [ ! -e "$HOME/.gitconfig.local" ] ; then
    touch "$HOME/.gitconfig.local"
fi
