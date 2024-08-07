return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    -- setup
    require("oil").setup()
    -- add keybindings
    vim.api.nvim_set_keymap('n', '<leader>-', '<cmd>Oil<CR>', { noremap = true, silent = true })
  end
}
