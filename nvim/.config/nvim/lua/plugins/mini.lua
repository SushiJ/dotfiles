return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      require('mini.statusline').setup {
        content = {
          section_location = function()
            return '%2l:%-2v'
          end,
          active = function()
            local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
            local git = MiniStatusline.section_git { trunc_width = 40 }
            local diff = MiniStatusline.section_diff { trunc_width = 75 }
            local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
            local lsp = MiniStatusline.section_lsp { trunc_width = 75 }
            local filename = MiniStatusline.section_filename { trunc_width = 140 }
            local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
            local location = MiniStatusline.section_location { trunc_width = 75 }
            local search = MiniStatusline.section_searchcount { trunc_width = 75 }

            -- Get the LSP name

            local lsp_name = function()
              local bufnr = vim.api.nvim_get_current_buf()
              if bufnr == nil then
                return 'No LSP'
              end
              local lsp_info = vim.lsp.get_clients { bufnr }

              if next(lsp_info) == nil then
                return ''
              end
              local name = lsp_info[1].config.name
              if name == nil then
                return ''
              else
                return '[' .. name .. ']'
              end
            end

            return MiniStatusline.combine_groups {
              { hl = mode_hl, strings = { mode } },
              { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics, lsp } },
              '%<', -- Mark general truncate point
              { hl = 'MiniStatuslineFilename', strings = { filename } },
              '%=', -- End left alignment
              { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
              { hl = mode_hl, strings = { search, location, lsp_name() } },
            }
          end,
        },
      }
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.bufremove').setup()
      require('mini.surround').setup()
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }
      require('mini.files').setup {}
      require('mini.comment').setup {}
      require('mini.pairs').setup {}
      require('mini.icons').setup {}
    end,
  },
}
