local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- map('n', 'zR', function()
--   require('ufo').openAllFolds()
-- end, { desc = 'open all folds' })
--
-- map('n', 'zM', function()
--   require('ufo').closeAllFolds()
-- end, { desc = 'close all folds' })

map('n', '<leader>cr', function()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end, { desc = '[C]ode [R]ename', expr = true })

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Unhighlight search' })
map('n', '<leader>e', function()
  require('oil').toggle_float()
end, { desc = 'Toggle Oil' })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Toggle Term float' })
map('n', '<leader>tt', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'Toggle Term' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>bd', function()
  require('mini.bufremove').delete(0, false)
end, { desc = 'Delete Buffer' })
map('n', '<leader>bD', function()
  require('mini.bufremove').delete(0, true)
end, { desc = 'Delete Buffer (Force)' })

-- Buffer management
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })

map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })

-- better up/down
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Move Lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- windows
map('n', '<leader>ww', '<C-W>p', { desc = 'Other window' })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window' })
map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below' })
map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right' })
map('n', '<leader>-', '<C-W>s', { desc = 'Split window below' })
map('n', '<leader>|', '<C-W>v', { desc = 'Split window right' })

-- Center cursor
local cc = { desc = 'Center Cursor' }
map('n', '<C-d>', '<C-d>zz', cc)
map('n', '<C-u>', '<C-u>zz', cc)
map('n', 'n', 'nzzzv', cc)
map('n', 'N', 'Nzzzv', cc)

map({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Yank to clipboard' })
map('n', '<leader>Y', [["+Y]], { desc = 'Yank to clip' })

-- misc.
map('n', '<leader>gS', vim.cmd.Git, { desc = 'Fugitive' })
map('n', '<leader>ut', vim.cmd.UndotreeToggle, { desc = 'Toggle undoTree' })
map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
map('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

-- YEP
map('i', '<C-c>', '<Esc>', { desc = 'Normal mode' })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

map('c', 'WQ', 'wq', {})
map('c', 'Wq', 'wq', {})
map('c', 'W', 'w', {})
map('c', 'Q', 'q', {})

-- map("n", "d", '"_d', { noremap = true })
-- map("n", "D", '"_D', { noremap = true })
-- map("n", "x", '"_x', { noremap = true })
-- map("v", "d", '"_d', { noremap = true })
-- map("v", "x", '"_x', { noremap = true })


-- plugin development
map('n', '<leader>sf', '<cmd>source %<cr>', { desc = 'Source current file' })
map({ 'n', 'v' }, '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
