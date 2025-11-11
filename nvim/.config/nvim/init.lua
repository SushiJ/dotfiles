require 'core.lsp'

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'

require 'core.lazy'

-- TODO: Checkout keymaps for the plugins and organize and use it

-- Total: 65 plugins
-- blink.cmp 7.85ms  start
-- ccc.nvim 2.95ms  start
-- Comment.nvim 2.92ms  BufEnter
-- conform.nvim 1.03ms  <C-s> ()
-- dressing.nvim 1.3ms  start
-- fidget.nvim 1.58ms  start
-- FixCursorHold.nvim 0.23ms  neotest
-- flutter-tools.nvim 0.64ms  start
-- friendly-snippets 0.27ms  blink.cmp
-- fzf-lua 2.87ms  start
-- gitsigns.nvim 1.18ms  start
-- grug-far.nvim 0.82ms  start
-- inc-rename.nvim 0.63ms  start
-- lazy.nvim 5.73ms  init.lua
-- lazydev.nvim 1.36ms  lua
-- leetcode.nvim 2.16ms  start
-- lsp_lines.nvim 0.41ms  nvim-lspconfig
-- mason.nvim 1.31ms  start
-- mini.ai 0.55ms  start
-- mini.bufremove 0.43ms  start
-- mini.statusline 0.56ms  start
-- mini.surround 0.5ms  start
-- neotest 5.48ms  start
-- neotest-jest 0.16ms  neotest
-- neotest-vitest 0.15ms  neotest
-- noice.nvim 0.69ms  VeryLazy
-- nui.nvim 0.15ms  leetcode.nvim
-- nvim-jdtls 0.51ms  start
-- nvim-lspconfig 2.17ms  start
-- nvim-nio 0.19ms  neotest
-- nvim-treesitter 4.95ms  tidal.nvim
-- nvim-ts-context-commentstring 1.27ms  Comment.nvim
-- nvim-ufo 1.79ms  start
-- nvim-web-devicons 0.1ms  start
-- oil.nvim 3.02ms  start
-- onedark.nvim 4.39ms  start
-- plenary.nvim 0.16ms  leetcode.nvim
-- promise-async 0.23ms  nvim-ufo
-- snacks.nvim 0.79ms  start
-- tidal-makros.nvim 1.22ms  start
-- tidal.nvim 7.48ms  start
-- todo-comments.nvim 1.8ms  VimEnter
-- toggleterm.nvim 1.88ms  start
-- tsc.nvim 0.7ms  start
-- undotree 0.25ms  start
-- vim-fugitive 0.79ms  start
-- vim-repeat 0.12ms  VeryLazy
-- vim-sleuth 0.44ms  start
-- vim-tidal 0.9ms  start
-- vimtex 0.27ms  start
-- which-key.nvim 0.54ms 󰢱 which-key  tidal-makros.nvim
-- yazi.nvim 1.48ms  VeryLazy

-- conjure  clojure
-- lazygit.nvim  <leader>lg  LazyGitFilter  LazyGitFilterCurrentFile  LazyGit  LazyGitConfig  LazyGitCurrentFile
-- luvit-meta
-- mason-nvim-dap.nvim  nvim-dap
-- nvim-dap  <F5>  <F1>  <F2>  <F3>  <leader>b  <leader>B  <F7>
-- nvim-dap-go  nvim-dap
-- nvim-dap-ui  nvim-dap
-- nvim-metals  sbt  scala
-- nvim-ts-autotag  typescript  typescriptreact  javascript  javascriptreact
-- vim-dadbod  vim-dadbod-ui
-- vim-dadbod-completion  sql  mysql  plsql  vim-dadbod-ui
-- vim-dadbod-ui  DBUI  DBUIToggle  DBUIAddConnection  DBUIFindBuffer
