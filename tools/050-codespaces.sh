#!/usr/bin/env bash

#
# set git user based on github user in codespaces
#

if [ "$GITHUB_USER" = "markus-wolf_statista" ] ; then
	git config unset --global user.email
	git config unset --global user.signingkey
	git config unset --global commit.gpgsign
fi
