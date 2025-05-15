return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    vim.lsp.config('mason-lspconfig', {
      on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
          bind = true,
          handler_opts = {
            border = "rounded"
          }
        }, bufnr)
      end
    })

    vim.lsp.config('ansiblels', {
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
    })

    vim.lsp.config('arduino_language_server', {
      cmd = { "arduino-language-server" },
      filetypes = { "arduino" },
      root_dir = require("lspconfig.util").root_pattern("*.ino")
    })

    vim.lsp.config('phpactor', {
      settings = {
        phpactor = {
          enable = true,
          completion = {
            enable = true
          },
          diagnostics = {
            enable = false
          },
          goto = {
            implementation = "goto_definition",
            typeDefinition = "goto_type_definition"
          },
          hover = {
            enable = true
          },
          index = {
            references = true
          },
          rename = {
            enable = true
          },
          signatureHelp = {
            enable = true
          },
          workspaceSymbolProvider = true
        }
      }
    })

    vim.lsp.config('rust_analyzer', {
      settings = {
        ['rust_analyzer'] = {
          diagnostics = {
            enable = true;
          }
        }
      }
    })

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
        "ts_ls",
        "vimls",
        "yamlls"
      }
    }
  end
}
