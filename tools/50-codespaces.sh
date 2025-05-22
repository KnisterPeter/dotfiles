#!/usr/bin/env bash

#
# set git user based on github user in codespaces
#

if [ "$GITHUB_USER" = "markus-wolf_statista" ] ; then
	git config set --global user.name "Markus Wolf"
	git config set --global user.email "markus.wolf@statista.com"
	git config set --global user.signingkey "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMgEYt9y0j59T7INYfZhjiox+oAg0MPQ0+e57uBKmb1H"
	git config set --global commit.gpgsign false
fi
