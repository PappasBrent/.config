#!/usr/bin/env bash

set -eu

KITTY_DIR="$HOME/.local/kitty.app/" 

upgrade=false
if getopts 'u' word; then
    upgrade=true
fi

if [[ ! -d "$KITTY_DIR" ]] || $upgrade; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

sudo update-alternatives \
    --install   /usr/bin/x-terminal-emulator    x-terminal-emulator "$KITTY_DIR/bin/kitty"  100 \
    --slave     /usr/bin/kitten                 kitten              "$KITTY_DIR/bin/kitten"

