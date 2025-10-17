return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = { 'bash', 'diff', 'markdown', 'lua', 'elixir', 'eex', 'heex', 'java' },
    auto_install = true,
    highlight = {
      enable = true,
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
}
