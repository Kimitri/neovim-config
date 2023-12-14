return {
  "vim-airline/vim-airline",
  lazy = false,
  config = function()
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
  end
}
