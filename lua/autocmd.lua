-- Startup autocmds
vim.api.nvim_create_autocmd(
  {"StdinReadPre"},
  { pattern = "*", command = "let s:std_in=1" }
)
vim.api.nvim_create_autocmd(
  {"VimEnter"},
  { pattern = "*", command = "if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | wincmd p | endif" }
)

-- File type specific autocmds
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*.module,*.install,*.test", command = "set foldmethod=indent" }
)
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.php", command = "set foldmethod=indent" })
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = "*.scss,*.sass,*.css", command = "set foldmethod=indent" }
)
-- Only disable Copilot if the plugin exists
if pcall(vim.fn.exists, "copilot") then
  vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = "*.rs,*.rust", command = "Copilot disable" }
  )
end

-- Disable Tabnine on markdown buffers
if pcall(vim.fn.exists, "tabnine") then
  vim.api.nvim_create_autocmd(
    { "BufRead", "BufNewFile" },
    { pattern = "*.md,*.mdown,*.markdown", command = "TabnineDisable" }
  )
end

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.hoverProvider then
      vim.keymap.set("n", "K", vim.diagnostic.open_float, { buffer = args.buf })
    end
  end,
})

-- Jump to the last position when opening a file
vim.cmd([[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])
-- Insert date as YYYY-MM-DD and disable Copilot for markdown files
vim.cmd([[autocmd BufNewFile *.md 0r !echo "\# $(date +\%Y-\%m-\%d)"]])
-- Insert opening PHP tag when creating a new PHP file
vim.cmd([[autocmd BufNewFile *.php 0r !echo "<?php"]])

-- Open all folds when opening a file
vim.cmd([[autocmd BufWinEnter *.* normal zR]])

vim.cmd("cnoreabbrev W w")
