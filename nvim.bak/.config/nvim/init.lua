require 'core.lsp'

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

require 'core.lazy'

-- nvim-biscuit
vim.api.nvim_set_hl(0, 'BiscuitColor', { link = 'Comment' })
