return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    local tree = require 'nvim-treesitter'
    tree.install { 'astro', 'svelte' }
  end,
  -- main = 'nvim-treesitter.configs',
  -- opts = {
  --   ensure_installed = { 'bash', 'diff', 'markdown', 'lua' },
  --   auto_install = true,
  --   highlight = {
  --     enable = true,
  --   },
  --   indent = { enable = true, disable = { 'ruby' } },
  -- },
}
