return {
  { 'mbbill/undotree' },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    'numToStr/Comment.nvim',
    event = { 'BufEnter' },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = function()
        require('ts_context_commentstring').setup {
          enable_autocmd = false,
        }
      end,
    },
    config = function()
      --- Comment configuration object _can_ take a partial and is merged in
      ---@diagnostic disable-next-line: missing-fields
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    'uga-rosa/ccc.nvim',
    config = function()
      local ccc = require 'ccc'
      ccc.setup {
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      }
    end,
  },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  {
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup {
        input_buffer_type = 'dressing',
      }
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require('ufo').setup {
        provider_selector = function()
          return { 'treesitter', 'indent' }
        end,
      }
    end,
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_method = 'tectonic'
    end,
  },
  {
    'dmmulroy/tsc.nvim',
    config = function()
      require('tsc').setup()
    end,
  },
}
