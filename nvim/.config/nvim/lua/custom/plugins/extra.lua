local gh = require('core.utils').gh
local extra = {
  gh 'stevearc/oil.nvim',
  gh 'windwp/nvim-autopairs',
  gh 'windwp/nvim-ts-autotag',
  gh 'mbbill/undotree',
  gh 'kevinhwang91/nvim-ufo',
  gh 'kevinhwang91/promise-async',
  gh 'serhez/bento.nvim',
  gh 'MeanderingProgrammer/render-markdown.nvim',
  gh 'brenoprata10/nvim-highlight-colors',
  gh 'hedyhli/outline.nvim',
  gh 'rachartier/tiny-inline-diagnostic.nvim',
}

vim.pack.add(extra)
require('ufo').setup {
  provider_selector = function(_bufnr, _filetype, _buftype) return { 'treesitter', 'indent' } end,
}

require('oil').setup {
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
    is_always_hidden = function(name, _) return name == '..' or name == '.git' or name == 'node_modules' end,
  },
  float = {
    max_width = 100,
    max_height = 100,
  },
}

require('nvim-autopairs').setup {}
require('bento').setup()

-- require('undotree').setup {
--   function()
--     local target_path = vim.fn.expand '~/.config/nvim/.undodir'
--     vim.opt.undodir = target_path
--     vim.opt.undofile = true
--   end,
-- }

-- require('nvim-numbertoggle').setup()

require('nvim-highlight-colors').setup {
  ---Render style
  ---@usage 'background'|'foreground'|'virtual'
  render = 'background',
  ---Highlight hex colors, e.g. '#FFFFFF'
  enable_hex = true,
  ---Highlight short hex colors e.g. '#fff'
  enable_short_hex = true,
  ---Highlight rgb colors, e.g. 'rgb(0 0 0)'
  enable_rgb = true,
  ---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
  enable_hsl = true,
  ---Highlight CSS variables, e.g. 'var(--testing-color)'
  enable_var_usage = true,
  ---Highlight named colors, e.g. 'green'
  enable_named_colors = true,
  ---Highlight tailwind colors, e.g. 'bg-blue-500'
  enable_tailwind = true,
}
require('outline').setup {}
require('render-markdown').setup {
  code = {
    sign = false,
    width = 'block',
    right_pad = 1,
  },
  heading = {
    sign = false,
    icons = {},
  },
}
require('tiny-inline-diagnostic').setup {
  preset = 'powerline',
  options = {
    add_messages = {
      display_count = true,
      messages = true,
    },
    multilines = {
      always_show = true,
      enabled = true,
    },
  },
}

-- { 'Bilal2453/luvit-meta', lazy = true },
