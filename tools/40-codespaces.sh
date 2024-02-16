#!/usr/bin/env bash

#
# set git user based on github user in codespaces
#

if [ "$GITHUB_USER" = "markus-wolf_statista" ] ; then

    cat <<EOF > "$HOME/.gitconfig.local"
[user]
	name = Markus Wolf
	email = markus.wolf@statista.com
	signingkey = ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMgEYt9y0j59T7INYfZhjiox+oAg0MPQ0+e57uBKmb1H
EOF

fi
