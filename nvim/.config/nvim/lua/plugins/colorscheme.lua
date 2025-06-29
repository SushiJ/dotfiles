return {
  {
    'sainnhe/gruvbox-material',
    -- config = function()
    --   vim.g.gruvbox_material_enable_italic = true
    --   vim.g.gruvbox_material_background = 'hard'
    --   vim.cmd [[colorscheme gruvbox-material]]
    -- end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd [[colorscheme tokyonight-night]]
    end,
  },
  {
    'vague2k/vague.nvim',
    config = function()
      vim.cmd [[colorscheme vague]]
    end,
  },
}
