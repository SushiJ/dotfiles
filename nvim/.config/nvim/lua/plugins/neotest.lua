return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-neotest/neotest-jest',
    'marilari88/neotest-vitest',
    config = function()
      require('neotest').setup {
        adapters = {
          require('neotest-jest').setup {
            jestCommand = 'pnpm test --',
            jestConfigFile = 'jest.config.js',
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
            isTestFile = require('neotest-jest.jest-util').defaultIsTestFile,
          },
          require 'neotest-vitest',
        },
      }
    end,
  },
}
