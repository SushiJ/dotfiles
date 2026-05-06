local gh = require('core.utils').gh
local tpope = {
  gh 'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  gh 'tpope/vim-dadbod',
  gh 'kristijanhusak/vim-dadbod-ui',
  gh 'kristijanhusak/vim-dadbod-completion',
  gh 'tpope/vim-fugitive',
  gh 'tpope/vim-surround',
}

vim.pack.add(tpope)
