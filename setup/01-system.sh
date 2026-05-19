#!/usr/bin/env bash

echo -n "Prepare OS packages ... "

declare -a to_install

to_install+=("npm")

for tool in curl wget zip unzip gpg sudo fzf direnv xauth ; do
    if ! which "$tool" > /dev/null 2>&1; then
        to_install+=("${tool}")
    fi
done

if [[ ! -f /etc/bash_completion ]] ; then
    to_install+=("bash-completion")
fi

# shellcheck disable=SC2155
go_pkg="$(apt-cache search 'golang-[.0-9]+$' | tail -n 1 | cut -d ' ' -f 1)"
if ! dpkg --list "${go_pkg}" > /dev/null 2>&1 ; then
    to_install+=("${go_pkg}")
fi

if [[ "$(id -u)" != "0" ]] ; then
    echo
    echo "We need to run with admin rights. You have to authenticate"
    echo
    sudo ls >/dev/null
fi

if [[ ${#to_install[@]} -gt 0 ]] ; then
    echo
    echo "--] Installing [--------"
    echo
    echo "${to_install[*]} ... "
    echo

    if which apt-get > /dev/null 2>&1 ; then
        sudo apt-get -qq update
        sudo apt-get -qq install -yy "${to_install[@]}"
    elif which dnf > /dev/null 2>&1 ; then
        sudo dnf install -y "${to_install[@]}"
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

# we can only add go to the path after install it
PATH="$PATH:$(dpkg --listfiles "${go_pkg}-go" | grep -e "/bin$")"
export PATH

if [ ! -e "$HOME/.gitconfig.local" ] ; then
    touch "$HOME/.gitconfig.local"
fi
