#/usr/bin/env bash

set -eu

URLS=(
    https://github.com/catppuccin/vim
    https://github.com/tpope/vim-surround
    https://github.com/machakann/vim-highlightedyank
    https://github.com/lewis6991/gitsigns.nvim
    https://github.com/tpope/vim-fugitive
)

upgrade=false
if getopts 'u' option; then upgrade=true; fi

for url in "${URLS[@]}"; do
    username=$(basename $(dirname $url))
    reponame=$(basename $url)
    plugin_directory="pack/$username/start/$reponame"
    mkdir -p $(dirname $plugin_directory)
    if [[ ! -d $plugin_directory ]] || $upgrade ; then
        rm -fr "$plugin_directory"
        git clone $url "$plugin_directory"
    else
        >&2 echo "Skipping downloading $username/$reponame; already downloaded."
        >&2 echo "Rerun with -u to upgrade."
    fi
done

# -s:	symbolic
# -f:	force overwrite
# -n:	don't add the link to the target directory, but replace the directory
# 	with the link
ln -snf "$HOME/.config/vim" "$HOME/.vim"
