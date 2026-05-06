vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.loader.enable()
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false

vim.o.breakindent = true -- Enable break indent
vim.o.undofile = true -- Enable undo/redo changes even after closing and reopening a file
vim.o.ignorecase = true
vim.o.smartcase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.signcolumn = 'yes' -- Keep signcolumn on by default
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time

vim.o.splitright = true
vim.o.splitbelow = true -- Configure how new splits should be opened

vim.o.list = true

vim.o.inccommand = 'split' -- Preview substitutions live, as you type!

vim.o.cursorline = true -- Show which line your cursor is on
vim.o.confirm = true

vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'noinsert' }
vim.opt.relativenumber = true
vim.opt.foldcolumn = '1'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

vim.opt.termguicolors = true
vim.opt.guicursor = ''
vim.opt.list = true
-- vim.opt.listchars = { space = '·', tab = '» ', trail = '-', nbsp = '␣', eol = '↲' }
vim.opt.listchars = { trail = '-', nbsp = '␣', eol = '↲' }
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shortmess:append 'c'
vim.o.winborder = 'rounded'

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
