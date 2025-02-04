return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      '~/git/awesome/',
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
