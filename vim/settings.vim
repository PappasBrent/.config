set nocompatible

filetype plugin on
filetype indent on

syntax on

set rnu
set colorcolumn=80
set termguicolors

set nowrap
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

set ignorecase
set smartcase

" Decrease updatetime so that gitgutter updates faster
set updatetime=100
set timeoutlen=400
set noerrorbells
set novisualbell
set t_vb=

" Enable seeing the search count and index in the bottom right.
set shortmess-=S

set incsearch

set clipboard^=unnamedplus,unnamed

" Show additional info about completions in a popup menu.
set completeopt+=popup

set nobackup

set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

" Only insert one space after periods when wrapping text, not two.
set nojoinspaces

if ! has("nvim")
    set undofile
    let &undodir=expand("$HOME/.config/vim/undodir")
    " Create undodir if it does not exist
    if ! isdirectory(&undodir)
        if exists("*mkdir")
            call mkdir(&undodir, "p")
        endif
    endif
endif
