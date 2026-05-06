local gh = require('core.utils').gh
local folke = {
  gh 'folke/which-key.nvim',
  gh 'folke/todo-comments.nvim', -- Highlight todo, notes, etc in comments
  gh 'folke/snacks.nvim',
  gh 'MunifTanjim/nui.nvim',
}

vim.pack.add(folke)

require('which-key').setup {
  -- Delay between pressing a key and opening which-key (milliseconds)
  delay = 200,
  preset = 'helix',
  icons = {
    mappings = true,
  },
  spec = {
    { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { '<leader>b', group = '[B]uffer', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
  filter = function(mapping) return mapping.desc ~= 'Disable space (leader) in normal mode' end,
}

require('todo-comments').setup { signs = false }

require('snacks').setup {
  dashboard = { enabled = false },
  indent = {
    enabled = true,
    chunk = {
      enabled = true,
    },
  },
  input = { enabled = true },
  scope = { enabled = false },
  picker = { enabled = true },
  dim = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  terminal = { enabled = true },
  toggle = { enabled = true },
}
