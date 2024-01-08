return {
    "williamboman/mason.nvim",
    config = function()
      -- Required on NixOS
      require("mason").setup {
        PATH = "append",
      }
    end
}
