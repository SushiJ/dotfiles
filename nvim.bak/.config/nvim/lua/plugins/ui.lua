return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    config = function()
      require('noice').setup {
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
          },
        },
        presets = {
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        notify = {
          enabled = false,
        },
      }
    end,
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },
  -- {
  --   'code-biscuits/nvim-biscuits',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   config = function()
  --     require('nvim-biscuits').setup {
  --       toggle_keybind = '<leader>tb',
  --       cursor_line_only = true,
  --       show_on_start = true,
  --       language_config = {
  --         markdown = {
  --           disabled = true,
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },
  { 'sitiom/nvim-numbertoggle' },
  -- {
  --   'shellRaining/hlchunk.nvim',
  --   event = { 'BufReadPre', 'BufNewFile' },
  --   config = function()
  --     require('hlchunk').setup {
  --       chunk = { enable = true },
  --     }
  --   end,
  -- },
}
