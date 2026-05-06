local gh = require('core.utils').gh
local ts = {
  gh 'dmmulroy/tsc.nvim',
  gh 'dmmulroy/ts-error-translator.nvim',
  gh 'pmizio/typescript-tools.nvim',
  gh 'marilari88/twoslash-queries.nvim',
  gh 'nvim-lua/plenary.nvim',
}
vim.pack.add(ts)
require('tsc').setup {
  auto_open_qflist = true,
  pretty_errors = false,
  flags = '--noEmit --pretty false', -- This just works
}
require('ts-error-translator').setup()
require('twoslash-queries').setup {
  multi_line = true,
  is_enabled = false,
  highlight = 'Comment',
}
require('typescript-tools').setup {
  config = {
    on_attach = function(client, buffer_number)
      require('twoslash-queries').attach(client, buffer_number)
      require('config.keymaps').map_lsp_keybinds(buffer_number)
    end,
  },
  settings = {
    -- tsserver_path = "~/.bun/bin/tsgo",
    -- Performance: separate diagnostic server for large projects
    separate_diagnostic_server = true,
    -- When to publish diagnostics
    publish_diagnostic_on = 'insert_leave',
    -- JSX auto-closing tags
    jsx_close_tag = {
      enable = true,
      filetypes = { 'javascriptreact', 'typescriptreact' },
    },
    tsserver_file_preferences = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayEnumMemberValueHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
    },

    tsserver_format_options = {
      insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
      semicolons = 'insert',
    },
    complete_function_calls = true,
    include_completions_with_insert_text = true,
    code_lens = 'off',
    disable_member_code_lens = true,
    tsserver_max_memory = 12288,
  },
}
