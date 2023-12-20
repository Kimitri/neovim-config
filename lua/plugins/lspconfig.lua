return {
  "neovim/nvim-lspconfig",
  config = function()
    require'lspconfig'.ansiblels.setup{
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
    require'lspconfig'.bashls.setup{}
    require'lspconfig'.ccls.setup{}
    require'lspconfig'.clangd.setup{}
    require'lspconfig'.clojure_lsp.setup{}
    require'lspconfig'.cssls.setup{}
    require'lspconfig'.dockerls.setup{}
    require'lspconfig'.elixirls.setup{}
    require'lspconfig'.elmls.setup{}
    require'lspconfig'.gopls.setup{}
    require'lspconfig'.graphql.setup{}
    require'lspconfig'.hls.setup{}
    require'lspconfig'.html.setup{}
    require'lspconfig'.jdtls.setup{}
    require'lspconfig'.jsonls.setup{}
    require'lspconfig'.nimls.setup{}
    require'lspconfig'.ocamlls.setup{}
    require'lspconfig'.phpactor.setup{}
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.rust_analyzer.setup{}
    require'lspconfig'.svelte.setup{}
    require'lspconfig'.terraformls.setup{}
    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.vimls.setup{}
    require'lspconfig'.vuels.setup{}
    require'lspconfig'.yamlls.setup{}
  end
}
