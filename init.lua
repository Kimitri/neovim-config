local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.loaded_python3_provider = 0

require("lazy").setup({
  "neovim/nvim-lspconfig",
  {
    "dracula/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"alexghergh/nvim-tmux-navigation",
    lazy = false,
    priority = 1000,
    config = function()

        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup({
            disable_when_zoomed = true, -- defaults to false
            keybindings = {
                left = '<C-h>',
                down = '<C-j>',
                up = '<C-k>',
                right = '<C-l>',
            }
        })

    end,
  },
  {
    "andrewferrier/wrapping.nvim",
    config = function()
      local opts = {
        auto_set_mode_heuristically = false,
      }
      wrapping = require("wrapping")
      wrapping.setup(opts)
      wrapping.soft_wrap_mode()
    end
  },
  {"ryanoasis/vim-devicons", lazy = false},
  {"honza/vim-snippets", lazy = false},
  "scrooloose/nerdtree",
  "preservim/nerdcommenter",
  {"mhinz/vim-startify", lazy = false},
  {"neoclide/coc.nvim", branch = "release"},
  "ms-jpq/coq_nvim",
  "hashivim/vim-terraform",
  "tpope/vim-fugitive",
  {"airblade/vim-gitgutter", lazy = false},
  "MaxMEllon/vim-jsx-pretty",
  "nvim-lua/plenary.nvim",
  {"nvim-telescope/telescope.nvim", lazy = false, tag = "0.1.1"},
  "nelsyeung/twig.vim",
  {"vim-airline/vim-airline", lazy = false},
  {"vim-airline/vim-airline-themes", lazy = false},
  "varnishcache-friends/vim-varnish",
  "ixru/nvim-markdown",
  "github/copilot.vim",
  "tikhomirov/vim-glsl",
  "evanleck/vim-svelte"
})

require'lspconfig'.ocamlls.setup{}
require'lspconfig'.terraformls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.ccls.setup{}
require'lspconfig'.jdtls.setup{}
require'lspconfig'.vuels.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.graphql.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.elixirls.setup{}
require'lspconfig'.clojure_lsp.setup{}
require'lspconfig'.nimls.setup{}
require'lspconfig'.phpactor.setup{}


-- Misc. options
vim.g.nocompatible = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "v"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmode = "longest:full,full"
vim.opt.cc = "80"
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.ttyfast = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Status line settings incl. Airline
vim.opt.statusline = "%<%f %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%) %P"

vim.g["airline_theme"] = "dracula"
vim.g["airline_powerline_fonts"] = 1

-- powerline symbols
vim.g["airline_left_sep"] = ""
vim.g["airline_left_alt_sep"] = ""
vim.g["airline_right_sep"] = ""
vim.g["airline_right_alt_sep"] = ""
vim.g["airline_symbols.branch"] = ""
vim.g["airline_symbols.colnr"] = " ℅:"
vim.g["airline_symbols.readonly"] = ""
vim.g["airline_symbols.linenr"] = " :"
vim.g["airline_symbols.maxlinenr"] = "☰ "
vim.g["airline_symbols.dirty"] = "*"


-- Key mappings
map("n", "<leader>ff", ":Telescope find_files<CR>", {noremap = true})
map("n", "<leader>fg", ":Telescope live_grep<CR>", {noremap = true})
map("n", "<leader>fb", ":Telescope buffers<CR>", {noremap = true})
map("n", "<leader>fh", ":Telescope help_tags<CR>", {noremap = true})
map("n", "<leader>fs", ":Telescope git_files<CR>", {noremap = true})

map("n", "<leader>tt", ":NERDTreeToggle<CR>", {noremap = true})

map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", {noremap = true})
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", {noremap = true})
map("v", "<A-j>", ":m '>+1<CR>gv=gv", {noremap = true})
map("v", "<A-k>", ":m '<-2<CR>gv=gv", {noremap = true})
map("n", "<A-h>", "<C-w>h", {noremap = true})
map("n", "<A-j>", "<C-w>j", {noremap = true})
map("n", "<A-k>", "<C-w>k", {noremap = true})
map("n", "<A-l>", "<C-w>l", {noremap = true})

-- Center active line when moving half a page up/down
map("n", "<C-d>", "<C-d>zz", {noremap = true})
map("n", "<C-u>", "<C-u>zz", {noremap = true})

-- Open file in atext by placing text and gf
map("n", "gf", ":vert winc f<cr>", {noremap = true})
-- Copies the current file path to the clipboard
map("n", "yf", ":let @+ = expand('%:p')<CR>")
-- Copies pwd to clipboard  
map("n", "yd", ":let @+ = expand('%:p:h')<CR>")


-- Autocmd
vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {pattern = "*.module,*.install,*.test", command = "set filetype=php; set foldmethod=indent"}
)
vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {pattern = "*.php", command = "set foldmethod=indent"}
)
vim.api.nvim_create_autocmd(
  {"BufRead", "BufNewFile"},
  {pattern = "*.scss,*.sass,*.css", command = "set foldmethod=indent"}
)

-- Jump to the last position when opening a file
vim.cmd [[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
-- Insert date as YYYY-MM-DD
vim.cmd [[autocmd BufNewFile *.md 0r !echo "\# $(date +\%Y-\%m-\%d)"]]
-- Insert opening PHP tag when creating a new PHP file
vim.cmd [[autocmd BufNewFile *.php 0r !echo "<?php"]]

-- Open all folds when opening a file
vim.cmd [[autocmd BufWinEnter *.* normal zR]]
