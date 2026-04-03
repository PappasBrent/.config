#/usr/bin/env bash

set -eu

function install_ycm() {
    if command -v python3; then
        if [[ -d './pack/ycm-core/start/YouCompleteMe.git' ]]; then
            pushd './pack/ycm-core/start/YouCompleteMe.git'
            ./install.py --all
            popd
        fi
    fi
}

declare -A URL_to_post_install_hook=(
    https://github.com/airblade/vim-gitgutter           :
    https://github.com/catppuccin/vim                   :
    https://github.com/machakann/vim-highlightedyank    :
    https://github.com/tpope/vim-commentary             :
    https://github.com/tpope/vim-fugitive               :
    https://github.com/tpope/vim-surround               :
    https://github.com/JMcKiern/vim-venter              :
    https://github.com/dense-analysis/ale               :
    https://github.com/ycm-core/YouCompleteMe.git       install_ycm
)

if >/dev/null command -v fzf; then
    URL_to_post_install_hook['https://github.com/junegunn/fzf']=':'
    URL_to_post_install_hook['https://github.com/junegunn/fzf.vim']=':'
fi

upgrade=false
if getopts 'u' option; then upgrade=true; fi

for url in "${!URL_to_post_install_hook[@]}"; do
    post_install_hook="${URL_to_post_install_hook[$url]}"
    username=$(basename $(dirname $url))
    reponame=$(basename $url)
    plugin_directory="pack/$username/start/$reponame"
    mkdir -p $(dirname $plugin_directory)
    if [[ ! -d $plugin_directory ]] || $upgrade ; then
        rm -fr "$plugin_directory"
        git clone --recurse-submodules $url "$plugin_directory"
        $post_install_hook
    else
        >&2 echo -e "\033[33mSkipping downloading $username/$reponame; already downloaded.\033[0m"
        >&2 echo -e "\033[33mRerun with -u to upgrade.\033[0m"
    fi
done

# -s:	symbolic
# -f:	force overwrite
# -n:	don't add the link to the target directory, but replace the directory
# 	with the link
ln -snf "$HOME/.config/vim" "$HOME/.vim"
