if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php

    autocmd BufRead,BufNewFile *.module set expandtab
    autocmd BufRead,BufNewFile *.module set tabstop=4
    autocmd BufRead,BufNewFile *.module set shiftwidth=4
    autocmd BufRead,BufNewFile *.module set autoindent
    autocmd BufRead,BufNewFile *.module set smartindent

    autocmd BufRead,BufNewFile *.inc set expandtab
    autocmd BufRead,BufNewFile *.inc set tabstop=4
    autocmd BufRead,BufNewFile *.inc set shiftwidth=4
    autocmd BufRead,BufNewFile *.inc set autoindent
    autocmd BufRead,BufNewFile *.inc set smartindent

  augroup END
endif
