return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    -- {
    --   '<C-s>',
    --   function()
    --     require('conform').format { async = true, lsp_format = 'fallback' }
    --   end,
    --   mode = '',
    --   desc = '[F]ormat buffer',
    -- },
  },
  opts = {
    notify_on_error = true,
    format_on_save = false,
    formatters_by_ft = {
      html = { 'prettierd', 'prettier' },
      htmldjango = { 'prettierd', 'prettier' },
      lua = { 'stylua' },
      python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
      json = { 'biome' },
      javascript = { 'prettierd', 'prettier' },
      -- javascript = { 'biome', 'eslint_d' },
      typescript = { 'prettierd', 'prettier' },
      -- typescript = { 'biome', 'eslint_d' },
      typescriptreact = { 'prettierd', 'prettier' },
      -- typescriptreact = { 'biome', 'eslint_d' },
      svelte = { 'prettierd' },
      astro = { 'prettierd', 'prettier' },
      vue = { 'prettierd', 'prettier' },
      -- vue = { 'biome', 'eslint_d' },
      clojure = { 'cljfmt' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      -- elm = { 'elm-format' },
    },
    formatters = {
      cljfmt = {
        -- Point to a specific config file if not using the project root default
        args = { 'format', '--config', '{:indentation? true :indents {#"^.*$" [[:inner 0] [:block 1]]}}' },
      },
    },
  },
}
