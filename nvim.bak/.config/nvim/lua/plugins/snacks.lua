return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = true },
    indent = {
      enabled = true,
      chunk = {
        enabled = true,
      },
    },
    input = { enabled = true },
    scope = { enabled = false },
    picker = { enabled = true },
    dim = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    terminal = { enabled = true },
    toggle = { enabled = true },
  },
}
