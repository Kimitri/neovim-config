local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


map("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true })
map("n", "<leader>fs", ":Telescope lsp_document_symbols<CR>", { noremap = true })
map("n", "<leader>fd", ":Telescope diagnostics<CR>", { noremap = true })

map("n", "<leader>gf", ":lua = vim.lsp.buf.format()<CR>", { noremap = true })

map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })
map("n", "<A-h>", "<C-w>h", { noremap = true })
map("n", "<A-j>", "<C-w>j", { noremap = true })
map("n", "<A-k>", "<C-w>k", { noremap = true })
map("n", "<A-l>", "<C-w>l", { noremap = true })

-- Center active line when moving half a page up/down
map("n", "<C-d>", "<C-d>zz", { noremap = true })
map("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Open file in atext by placing text and gf
map("n", "gf", ":vert winc f<cr>", { noremap = true })
-- Copies the current file path to the clipboard
map("n", "yf", ":let @+ = expand('%:p')<CR>")
-- Copies pwd to clipboard
map("n", "yd", ":let @+ = expand('%:p:h')<CR>")
