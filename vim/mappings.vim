let mapleader=" "
let maplocalleader=" "

" Quickly escape normal mode.
inoremap jj <ESC>

" Recenter after selecting next search result and paging up or down.
nnoremap n  nzzzv
nnoremap N  Nzzzv
nnoremap <C-d>  <C-d>zz
nnoremap <C-u>  <C-u>zz

" Move lines around.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Better indenting in visual mode.
vnoremap < <gv
vnoremap > >gv

" Buffer navigation.
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Join lines and keep cursor position
nnoremap J mzJ`z

" Quickly edit and source vimrc.
nnoremap <leader>rc :e $MYVIMRC<CR>
nnoremap <leader>o :so $MYVIMRC<CR>

" Quickly rewrap text.
nnoremap <A-q> gwap

" Yank until end of line
nnoremap Y y$
