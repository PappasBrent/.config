augroup C_Commands
    au!
    au BufEnter *.c setlocal cindent
    au FileType c nnoremap <localleader>m :write <bar> :execute "silent !clear" <bar> make!<CR>
    au FileType c nnoremap <localleader>t :write <bar> :execute "silent !clear" <bar> make! test<CR>
augroup END

augroup Tex_Commands
    au!
    au FileType tex setlocal wrap
augroup END

augroup TSV_Commands
    au!
    au BufEnter *.tsv setlocal list noexpandtab softtabstop=8 shiftwidth=8 listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
augroup END

augroup Bash_Commands
    au!
    au FileType sh nnoremap <localleader>m :write <bar> :!clear && ./%<CR>
augroup END

augroup Python_Commands
    au!
    au FileType python nnoremap <localleader>m :write <bar> :!clear && ./%<CR>
augroup END

augroup Git_Commit
    au!
    au FileType gitcommit setlocal spell tw=72
augroup END

augroup Go_Commands
    au!
    au FileType go nnoremap <localleader>m :write <bar> :!clear && go run %<CR>
augroup END

augroup MD_Commands
    au!
    if executable('prettier')
        au FileType markdown nnoremap <localleader>t vip:!prettier --parser markdown<CR>
    endif
augroup END

augroup Spelling
    au!
    au BufEnter *.txt,*.md,*.typ,*.tex setlocal spell
augroup END

" Return to last edit position when opening files.
augroup Vim_Start
    au!
    " Taken from default.vim.
    "
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim), for a commit or rebase message
    " (likely a different one than last time), and when using xxd(1) to filter
    " and edit binary files (it transforms input files back and forth, causing
    " them to have dual nature, so to speak). For commit messages, jump two
    " lines down because that's where the title is in the commit template I use.
    autocmd BufReadPost *
                \ if &filetype == 'gitcommit' | execute "normal gg2j" | endif
                \ | let line = line("'\"")
                \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
                \      && index(['xxd', 'gitrebase'], &filetype) == -1
                \ |   execute "normal! g`\"zz"
                \ | endif
augroup END
