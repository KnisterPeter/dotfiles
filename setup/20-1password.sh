#!/usr/bin/env bash


if [ "$INSTALL_SECRETS" != "false" ] ; then
    echo -n "Install 1Password ... "

    if [ ! -f /tmp/1password.zip ] ; then
        curl -s -o /tmp/1password.zip https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/op_linux_amd64_v1.12.3.zip
        unzip -o /tmp/1password.zip -d /tmp/

        gpg --keyserver hkp://keyserver.ubuntu.com:80 --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
        gpg --verify /tmp/op.sig /tmp/op
    fi

    echo "✔️"
fi

