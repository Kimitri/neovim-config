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
      ["arduino_language_server"] = function ()
        require("lspconfig").arduino_language_server.setup {
          cmd = { "arduino-language-server" },
          filetypes = { "arduino" },
          root_dir = require("lspconfig.util").root_pattern("*.ino")
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
