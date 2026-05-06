local gh = require('core.utils').gh

local plugins = {
  gh 'j-hui/fidget.nvim',
  { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' },
  gh 'rafamadriz/friendly-snippets',
  { src = gh 'saghen/blink.cmp', version = vim.version.range '1.*' },
}
vim.pack.add(plugins)

require('fidget').setup {
  notification = { window = { winblend = 100 } },
  progress = { display = { progress_icon = { 'dots_negative' } } },
}

require('luasnip').setup {}

-- `friendly-snippets` contains a variety of premade snippets.
--    See the README about individual language/framework/plugin snippets:
--    https://github.com/rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

require('blink.cmp').setup {
  keymap = { preset = 'default' },
  signature = { enabled = true },
  appearance = { nerd_font_variant = 'mono' },
  completion = { documentation = { auto_show = false } },
  sources = { default = { 'lsp', 'buffer', 'path', 'snippets' } },
  -- sources = {
  --   default = { 'lsp', 'buffer', 'path', 'snippets', 'lazydev', 'cmdline' },
  --   providers = {
  --     lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
  --   },
  snippets = { preset = 'luasnip' },
  fuzzy = { implementation = 'lua' },
}
