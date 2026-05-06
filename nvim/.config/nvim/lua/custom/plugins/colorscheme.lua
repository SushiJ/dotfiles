local gh = require('core.utils').gh

vim.pack.add {
  gh 'shatur/neovim-ayu',
}

require('ayu').setup {
  mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
  terminal = true, -- Set to `false` to let terminal manage its own colors.
  vim.cmd.colorscheme 'ayu',
}
