return {
  "fatih/vim-go",
  config = function()
    -- LSP settings
    vim.g["go_def_mode"]='gopls'
    vim.g["go_info_mode"]='gopls'
  end
}
