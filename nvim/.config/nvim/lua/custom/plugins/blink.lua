local gh = require('core.utils').gh

vim.pack.add { gh 'j-hui/fidget.nvim' }

require('fidget').setup {
  notification = {
    window = {
      winblend = 100,
    },
  },
  progress = {
    display = {
      progress_icon = { 'dots_negative' },
    },
  },
}

vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
require('luasnip').setup {}

-- `friendly-snippets` contains a variety of premade snippets.
--    See the README about individual language/framework/plugin snippets:
--    https://github.com/rafamadriz/friendly-snippets
--
vim.pack.add { gh 'rafamadriz/friendly-snippets' }
require('luasnip.loaders.from_vscode').lazy_load()

vim.pack.add { { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' } }
require('blink.cmp').setup {
  -- completion = { documentation = { auto_show = false } },
  -- signature = { enabled = true, trigger = { show_on_insert = false } },
  -- sources = {
  --   default = { 'lsp', 'buffer', 'path', 'snippets', 'lazydev', 'cmdline' },
  --   providers = {
  --     lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
  --   },
  -- },
  -- snippets = { preset = 'luasnip' },
  -- fuzzy = { implementation = 'lua' },
  keymap = {
    preset = 'default',
  },
  signature = { enabled = true },
  appearance = {
    nerd_font_variant = 'mono',
  },
  completion = {
    documentation = { auto_show = false },
  },
  sources = {
    default = { 'lsp', 'buffer', 'path', 'snippets' },
  },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'lua' },
}
