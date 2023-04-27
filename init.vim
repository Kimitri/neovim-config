call plug#begin()
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
" Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'hashivim/vim-terraform'
 Plug 'tpope/vim-fugitive'
 Plug 'airblade/vim-gitgutter'
 Plug 'MaxMEllon/vim-jsx-pretty'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
 Plug 'nelsyeung/twig.vim'
 Plug 'christoomey/vim-tmux-navigator'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:loaded_python3_provider = 0
let mapleader = "\<Space>"

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set relativenumber          " Relative line numbers
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set clipboard+=unnamedplus
" set shell=/bin/bash\ -li

let g:airline_theme='onedark'
let g:airline_powerline_fonts=1

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

 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable

colorscheme dracula
" open new split panes to right and below
set splitright
set splitbelow


set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" move line or visually selected block - alt+j/k
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv " move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L " move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Press i to enter insert mode, and ii to exit insert mode.
":inoremap ii <Esc>
":inoremap jk <Esc>
":inoremap kj <Esc>
":vnoremap jk <Esc>
":vnoremap kj <Esc>

" Center active line when moving half a page up or down
:nnoremap <C-d> <C-d>zz
:nnoremap <C-u> <C-u>zz

" open file in a text by placing text and gf
nnoremap gf :vert winc f<cr> " copies filepath to clipboard by pressing yf
:nnoremap <silent> yf :let @+=expand('%:p')<CR>
" copies pwd to clipboard: command yd
:nnoremap <silent> yd :let @+=expand('%:p:h')<CR> " Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
