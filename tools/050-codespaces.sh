#!/usr/bin/env bash

#
# set git user based on github user in codespaces
#

if [ -n "$CODESPACES" ] ; then
    echo -n "  🔹 Codespaces"

	git config unset --global user.email
	git config unset --global user.signingkey
	git config unset --global commit.gpgsign

	export INSIDE_CODESPACES=1

    echo ""
fi
