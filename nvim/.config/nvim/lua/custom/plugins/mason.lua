local gh = require('core.utils').gh

local lsp = {
  gh 'neovim/nvim-lspconfig',
  gh 'mason-org/mason.nvim',
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
}
vim.pack.add(lsp)

require('mason').setup {
  ui = {
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}
