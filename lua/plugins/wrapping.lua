return {
  "andrewferrier/wrapping.nvim",
  config = function()
    local opts = {
      auto_set_mode_heuristically = false,
    }
    wrapping = require("wrapping")
    wrapping.setup(opts)
    wrapping.soft_wrap_mode()
  end
}
