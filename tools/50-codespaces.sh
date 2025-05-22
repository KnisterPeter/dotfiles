#!/usr/bin/env bash

#
# set git user based on github user in codespaces
#

if [ "$GITHUB_USER" = "markus-wolf_statista" ] ; then
	# git config set --global user.name "Markus Wolf"
	# git config set --global credential.helper "/.codespaces/bin/gitcredential_github.sh"
	# git config set --global gpg.program "/.codespaces/bin/gh-gpgsign"
	git config unset user.signingkey
	git config unset commit.gpgsign
fi
