return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "ansiblels",
        "bashls",
        "dockerls",
        "gopls",
        "graphql",
        "html",
        "jsonls",
        "phpactor",
        "pyright",
        "rust_analyzer",
        "tsserver",
        "vimls",
        "yamlls"
      }
    }

    require("mason-lspconfig").setup_handlers {
      function (server_name)
        require("lspconfig")[server_name].setup {}
      end,
      ["ansiblels"] = function ()
        require("lspconfig").ansiblels.setup {
          settings = {
            ansible = {
              validation = {
                enabled = true,
                lint = {
                  enabled = false
                }
              }
            }
          }
        }
      end,
      ["luals"] = function ()
        require("lspconfig").luals.setup {
          settings = {
            command = { "lua-language-server" },
          }
        }
      end,
      ["rust_analyzer"] = function ()
        require'lspconfig'.rust_analyzer.setup{
          settings = {
            ['rust_analyzer'] = {
              diagnostics = {
                enable = true;
              }
            }
          }
        }
      end
    }
  end
}
