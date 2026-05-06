return {
  {
    'windwp/nvim-ts-autotag',
    ft = {
      'typescriptreact',
      'typescript',
      'javascript',
      'javascriptreact',
    },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
}
