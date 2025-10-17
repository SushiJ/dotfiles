return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-neotest/neotest-jest',
    'marilari88/neotest-vitest',
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-jest' {
          jestCommand = 'pnpm test --',
          jestArguments = function(defaultArguments, context)
            return defaultArguments
          end,
          jestConfigFile = 'jest.config.js',
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
        require 'neotest-vitest',
      },
    }
  end,
}
