if has("autocmd")
  augroup markdown
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.mdown set filetype=markdown
    autocmd BufRead,BufNewFile *.markdown set filetype=markdown

    autocmd BufRead,BufNewFile *.md set expandtab
    autocmd BufRead,BufNewFile *.md set tabstop=2
    autocmd BufRead,BufNewFile *.md set shiftwidth=2
    autocmd BufRead,BufNewFile *.md set autoindent
    autocmd BufRead,BufNewFile *.md set smartindent

    autocmd BufRead,BufNewFile *.mdown set expandtab
    autocmd BufRead,BufNewFile *.mdown set tabstop=2
    autocmd BufRead,BufNewFile *.mdown set shiftwidth=2
    autocmd BufRead,BufNewFile *.mdown set autoindent
    autocmd BufRead,BufNewFile *.mdown set smartindent

    autocmd BufRead,BufNewFile *.markdown set expandtab
    autocmd BufRead,BufNewFile *.markdown set tabstop=2
    autocmd BufRead,BufNewFile *.markdown set shiftwidth=2
    autocmd BufRead,BufNewFile *.markdown set autoindent
    autocmd BufRead,BufNewFile *.markdown set smartindent
  augroup END
endif
