:lua << EOF " Enable lua till end of file
local nvim_lsp = require('lspconfig')

nvim_lsp.elixirls.setup{
  cmd = { '/home/chris/.elixir-ls/release/language_server.sh' },
  on_attach = on_attach,
  settings = {
    elixirLS = {
      fetchDeps = false
    }
  }
}

