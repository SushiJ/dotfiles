return {
  { 'tidalcycles/vim-tidal' },
  {
    'thgrund/tidal.nvim',
    opts = {
      -- Your configuration here
      -- See configuration section for defaults
    },
    -- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      opts = { ensure_installed = { 'haskell', 'supercollider' } },
    },
  },
  {
    'tpope/vim-repeat',
    event = 'VeryLazy',
  },
  {
    'thgrund/tidal-makros.nvim',
    config = function()
      require('makros').setup()
    end,
  },
}
