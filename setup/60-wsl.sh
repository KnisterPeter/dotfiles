#!/usr/bin/env bash

if [ "$INSIDE_WSL" = "true" ]; then

    echo -n "Configure WSL ... "

    # manual setup
    # 1. install 1password in windows
    # 2. setup openssh in windows (newer version)
    # 3. setup ssh config with IdentitiesOnly and public key on windows
    # 4. copy public keys into windows .ssh folder
    # 5. put ssh config into wsl .ssh folder as well (e.g. for github cli)
    # 6. locate AppData/Local/1Password/app/8/op-ssh-sign-wsl and give to this prompt

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

    # install wsl sudo
    if [[ ! -d /etc/pam_wsl_hello/ ]] ; then
        mkdir -p /tmp/wsl-sudo
        pushd /tmp/wsl-sudo || exit
        curl -fsSL -o "release.tar.gz" https://github.com/nullpo-head/WSL-Hello-sudo/releases/download/v2.0.0/release.tar.gz
        tar xzf release.tar.gz
        cd release || exit
        ./install.sh
        popd || exit
    fi

    echo "✔️"
fi
