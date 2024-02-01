#!/usr/bin/env bash

if [ "$INSIDE_WSL" = "true" ]; then

    echo -n "Configure WSL ... "

    to_install=
    # socat is not required with the alias setup
    # if ! which socat > /dev/null 2>&1; then
    #     echo "Missing socat."
    #     to_install="$to_install socat"
    # fi

    if [ -n "$to_install" ] ; then
        if which apt > /dev/null 2>&1 ; then
            sudo apt update
            # shellcheck disable=SC2086
            sudo apt install -yy $to_install
        elif which dnf > /dev/null 2>&1 ; then
            # shellcheck disable=SC2086
            sudo dnf install -y $to_install
        else
            echo "Unknown system"
            exit 1
        fi
    fi

    # npiperelay is not required with the alias setup
    # if ! which npiperelay.exe > /dev/null 2>&1; then
    #   mkdir ~/source/npiperelay
    #   pushd ~/source/npiperelay
    #   wget https://github.com/jstarks/npiperelay/archive/refs/heads/master.zip
    #   unzip master.zip
    #   rm master.zip
    #   cd npiperelay-master
    #   GOOS=windows go build -o "$HOME/bin/npiperelay.exe"
    #   popd
    # fi

    # enable windows ssh for git usage
    # They can access the windows ssh-agent and
    # use the windows ssh config

    git config --file="$HOME/.gitconfig.local" core.sshCommand ssh.exe

    gpg_ssh_program="$(git config --get gpg.ssh.program)"
    if [ -z "$gpg_ssh_program" ]; then
        read -r -p "Please add the location of the op-ssh-sign-wsl binary from your 1Password installation" gpg_ssh_program
        if [ -n "$gpg_ssh_program" ]; then
            git config --file="$HOME/.gitconfig.local" gpg.ssh.program "$$gpg_ssh_program"
        fi
    fi

    if ! which wsl-open > /dev/null 2>&1; then
        npm install --global wsl-open
    fi

    echo "✔️"
fi
