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
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.hoverProvider then
      vim.keymap.set('n', 'K', vim.diagnostic.open_float, { buffer = args.buf })
    end
  end,
})

-- Jump to the last position when opening a file
vim.cmd [[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
-- Insert date as YYYY-MM-DD
vim.cmd [[autocmd BufNewFile *.md 0r !echo "\# $(date +\%Y-\%m-\%d)"]]
-- Insert opening PHP tag when creating a new PHP file
vim.cmd [[autocmd BufNewFile *.php 0r !echo "<?php"]]

-- Open all folds when opening a file
vim.cmd [[autocmd BufWinEnter *.* normal zR]]
