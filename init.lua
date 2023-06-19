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
  {
    "dracula/vim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme dracula]])
    end,
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {"christoomey/vim-tmux-navigator", lazy = false},
  {"ryanoasis/vim-devicons", lazy = false},
  {"honza/vim-snippets", lazy = false},
  "scrooloose/nerdtree",
  "preservim/nerdcommenter",
  {"mhinz/vim-startify", lazy = false},
  {"neoclide/coc.nvim", branch = "release"},
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
  "github/copilot.vim"
})

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
vim.opt.ttyfast = true
vim.opt.splitright = true
vim.opt.splitbelow = true

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
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope help_tags<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fs", ":Telescope git_files<CR>", {noremap = true})

vim.api.nvim_set_keymap("n", "<leader>tt", ":NERDTreeToggle<CR>", {noremap = true})


map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", {remap = true})
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>")
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>")
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>")

vim.cmd([[
  source ~/.config/nvim/old_init.vim
]])
