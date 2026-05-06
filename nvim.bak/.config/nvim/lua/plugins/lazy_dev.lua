return {
  'folke/lazydev.nvim',
  ft = 'lua',
  opts = {
    library = {
      '~/git/awesome/',
      '~/.local/share/love-api/',
      '/usr/share/awesome/lib/',
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
