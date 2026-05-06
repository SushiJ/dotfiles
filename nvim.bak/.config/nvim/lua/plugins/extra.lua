return {
  { 'mbbill/undotree' },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup {
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },
  -- {
  --   'lervag/vimtex',
  --   lazy = false, -- we don't want to lazy load VimTeX
  --   -- tag = "v2.15", -- uncomment to pin to a specific release
  --   init = function()
  --     -- VimTeX configuration goes here, e.g.
  --     vim.g.vimtex_view_method = 'zathura'
  --     vim.g.vimtex_compiler_method = 'tectonic'
  --   end,
  -- },
  {
    'serhez/bento.nvim',
    opts = {},
  },
  {
    'alex-popov-tech/store.nvim',
    dependencies = {
      -- { 'OXY2DEV/markview.nvim', opts = {} },
      -- Optional: inline image rendering in README previews (Kitty, Ghostty, WezTerm only)
      -- { "3rd/image.nvim", opts = { integrations = { markdown = { enabled = false } } } },
    },
    opts = {
      -- layout = "tab", -- recommended when using image preview
    },
    cmd = 'Store',
  },
  {
    'Sang-it/reader.nvim',
    cmd = 'Reader',
    opts = {},
  },
}
