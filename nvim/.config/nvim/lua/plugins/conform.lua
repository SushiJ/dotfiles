return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<C-s>',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = false,
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff' },
      javascript = { 'biome', stop_after_first = true },
      typescript = { 'biome', stop_after_first = true },
      typescriptreact = { 'biome', stop_after_first = true },
      svelte = { 'biome', stop_after_first = true },
      vue = { 'biome', stop_after_first = true },
      clojure = { 'cljfmt' },
      c = { 'clang-format' },
      cpp = { 'clang-format' },
      elm = { 'elm-format' },
    },
  },
}
