local hour = function()
  return os.date('*t').hour
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      if hour() >= 18 or hour() < 12 then
        vim.cmd [[colorscheme tokyonight-night]]
      end
    end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      if 12 < hour() and hour() < 18 then
        vim.o.background = 'light'
        vim.cmd 'colorscheme rose-pine'
      end
    end,
  },
  -- {
  -- 'sainnhe/gruvbox-material',
  -- config = function()
  --   vim.g.gruvbox_material_enable_italic = true
  --   vim.g.gruvbox_material_background = 'hard'
  --   vim.cmd [[colorscheme gruvbox-material]]
  -- end,
  -- },
  -- {
  --   'vague2k/vague.nvim',
  --   config = function()
  --     -- vim.cmd [[colorscheme vague]]
  --   end,
  -- },
  -- {
  --   'shaunsingh/solarized.nvim',
  --   config = function()
  --     vim.o.background = 'light'
  --     require('solarized').set()
  --   end,
  -- },
}
