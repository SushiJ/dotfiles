local vue_language_server_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}
---@type table<string, vim.lsp.Config>
local servers = {
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
      end

      ---@diagnostic disable-next-line: param-type-mismatch
      -- client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      --   runtime = {
      --     version = 'LuaJIT',
      --     path = { 'lua/?.lua', 'lua/?/init.lua' },
      --   },
      -- workspace = {
      --   checkThirdParty = false,
      --   -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
      --   --  See https://github.com/neovim/nvim-lspconfig/issues/3189
      --   library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
      --     '${3rd}/luv/library',
      --     '${3rd}/busted/library',
      --   }),
      -- },
      -- })
    end,
    settings = {
      Lua = {
        format = { enable = false }, -- Disable formatting (formatting is done by stylua)
        diagnostics = {
          disable = { 'missing-fields' },
          globals = {
            'vim',
            'Snacks',

            'awesome',
            'button',
            'dbus',
            'drawable',
            'drawin',
            'key',
            'keygrabber',
            'mousegrabber',
            'selection',
            'tag',
            'window',
            'table.unpack',
            'math.atan2',
            'screen',
            'mouse',
            'root',
            'client',
          },
        },
        hint = {
          enable = true,
          setType = false,
          paramType = true,
          paramName = 'Disable',
          semicolon = 'Disable',
          arrayIndex = 'Disable',
        },
      },
    },
  },
  pyright = {
    on_attach = function(client, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
        ---@diagnostic disable-next-line: missing-fields
        client:exec_cmd {
          command = 'pyright.organizeimports',
          arguments = { vim.uri_from_bufnr(bufnr) },
        }
      end, {
        desc = 'Organize Imports',
      })
    end,
    settings = {
      python = {
        analysis = {
          ignore = { '*' },
        },
      },
    },
  },
  vtsls = {
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            vue_plugin,
          },
        },
      },
    },
    filetypes = { 'vue' },
  },
  vue_ls = {
    on_init = function(client)
      client.handlers['tsserver/request'] = function(_, result, context)
        local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = 'vtsls' }
        if #clients == 0 then
          vim.notify('Could not found `vtsls` lsp client, vue_lsp would not work without it.', vim.log.levels.ERROR)
          return
        end
        local ts_client = clients[1]

        local param = table.unpack(result)
        local id, command, payload = table.unpack(param)
        ts_client:exec_cmd({
          title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
          command = 'typescript.tsserverRequest',
          arguments = {
            command,
            payload,
          },
        }, { bufnr = context.bufnr }, function(_, r)
          local response_data = { { id, r.body } }
          ---@diagnostic disable-next-line: param-type-mismatch
          client:notify('tsserver/response', response_data)
        end)
      end
    end,
  },
  oxfmt = {},
}

for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  underline = true,
  float = {
    border = 'rounded',
    source = true,
  },
  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },

  -- Can switch between these as you prefer
  virtual_text = false, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
}
