local gh = require('core.utils').gh

vim.pack.add { gh 'stevearc/conform.nvim' }

vim.keymap.set({ 'n', 'v' }, '<C-s>', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

require('conform').setup {
  notify_on_error = true,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' },
    clojure = { 'cljfmt' },

    htmldjango = { 'prettierd', 'prettier' },
    html = { 'oxfmt' },
    javascript = { 'oxfmt' },
    javascriptreact = { 'oxfmt' },
    typescript = { 'oxfmt' },
    typescriptreact = { 'oxfmt' },
    json = { 'oxfmt' },
    vue = { 'oxfmt' },
    svelte = { 'prettierd' },
    astro = { 'prettierd', 'prettier' },
    css = { 'oxfmt' },
    toml = { 'oxfmt' },
    graphql = { 'oxfmt' },
    yaml = { 'oxfmt' },
  },
  formatters = {
    cljfmt = {
      -- Point to a specific config file if not using the project root default
      args = { 'format', '--config', '{:indentation? true :indents {#"^.*$" [[:inner 0] [:block 1]]}}' },
    },
  },
}
-- json = { 'biome' },
-- javascript = { 'prettierd', 'prettier' },
-- javascript = { 'biome', 'eslint_d' },
-- typescript = { 'prettierd', 'prettier' },
-- typescript = { 'biome', 'eslint_d' },
-- typescriptreact = { 'prettierd', 'prettier' },
-- typescriptreact = { 'biome', 'eslint_d' },
-- svelte = { 'prettierd' },
-- astro = { 'prettierd', 'prettier' },
-- vue = { 'prettierd', 'prettier' },
-- vue = { 'biome', 'eslint_d' },
-- elm = { 'elm-format' },
