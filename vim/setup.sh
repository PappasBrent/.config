#/usr/bin/env bash

set -eu

# -s:	symbolic
# -f:	force overwrite
# -n:	don't add the link to the target directory, but replace the directory
# 	with the link
ln -snf "$HOME/.config/vim" "$HOME/.vim"
