return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'dracula',
        disabled_filetypes = { 'nerdtree', 'dashboard' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'dirty',
          {
            'diff',
            colored = true, -- Displays a colored diff status if set to true
            -- all colors are in format #rrggbb
            diff_color = {
              -- Same color values as the general color option can be used here.
              added    = { fg = '#73daca',  gui='italic' },    -- Changes the diff's added color
              modified = { fg = '#c0caf5',  gui='italic' }, -- Changes the diff's modified color
              removed  = { fg = '#f7768e',  gui='italic' }, -- Changes the diff's removed color you
            },
            symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
            source = nil, -- A function that works as a data source for diff.
            -- It must return a table as such:
            --   { added = add_count, modified = modified_count, removed = removed_count }
            -- or nil on failure. count <= 0 won't be displayed.
            padding = { left = 1, right = 0 }, -- Add padding to the diff component.
          },
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ' },
            diagnostics_color = {
              color_error = { fg = '#f7768e',  gui='italic' },
              color_warn = { fg = '#e0af68',  gui='italic' },
              color_info = { fg = '#c0caf5',  gui='italic' },
            },
          },
        },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'nvim-tree' },
    }
  end,
}
