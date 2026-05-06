local gh = require('core.utils').gh

vim.pack.add {
  gh 'folke/tokyonight.nvim',
  gh 'gmr458/vscode_modern_theme.nvim',
  gh 'shatur/neovim-ayu',
}

require('ayu').setup {
  mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
  terminal = true, -- Set to `false` to let terminal manage its own colors.
  vim.cmd.colorscheme 'ayu',
}

require('vscode_modern').setup {
  cursorline = true,
  transparent_background = false,
  nvim_tree_darker = true,
}
-- vim.cmd.colorscheme 'vscode_modern'

-- require('tokyonight').setup {}
--
-- vim.cmd.colorscheme 'tokyonight-night'
