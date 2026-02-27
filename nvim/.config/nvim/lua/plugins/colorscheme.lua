return {
  {

    'embark-theme/vim',
    lazy = false,
    priority = 1000,
    name = 'embark',
    config = function()
      -- vim.cmd.colorscheme 'embark'
    end,
  },
  {
    'Shatur/neovim-ayu',
    config = function()
      local ayu = require 'ayu'
      ayu.setup {
        mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        terminal = true, -- Set to `false` to let terminal manage its own colors.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      }
      ayu.colorscheme()
    end,
  },
}
