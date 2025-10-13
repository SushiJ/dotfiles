local function augroup(name)
  return vim.api.nvim_create_augroup('sushi_' .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
  group = augroup 'checktime',
  command = 'checktime',
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup 'highlight_yank',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup 'resize_splits',
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  group = augroup 'last_loc',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  group = augroup 'svg',
  pattern = '*.svg',
  callback = function()
    vim.opt_local.filetype = 'html'
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  group = augroup 'c_lang',
  pattern = {
    '*.c',
    '*.h',
    '*.cpp',
  },
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  group = augroup 'tex',
  pattern = '*.tex',
  callback = function()
    vim.opt_local.filetype = 'tex'
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'close_with_q',
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'query', -- :InspectTree
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'oil',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'wrap_spell',
  pattern = { 'gitcommit', 'markdown' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'oil',
  pattern = 'oil',
  callback = function()
    vim.opt_local.colorcolumn = ''
  end,
})

-- vim.api.nvim_create_autocmd('FileType', {
--   group = augroup 'nvim-metals',
--   pattern = { 'scala', 'sbt' },
--   callback = function()
--     require('metals').initialize_or_attach {}
--   end,
-- })

vim.api.nvim_create_user_command('ToggleDiagnostics', function()
  if vim.g.diagnostics_enabled == nil then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.enable(false)
  elseif vim.g.diagnostics_enabled then
    vim.g.diagnostics_enabled = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_enabled = true
    vim.diagnostic.enable()
  end
end, {})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    local function diagnostic_goto(next, severity)
      local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
      severity = severity and vim.diagnostic.severity[severity] or nil
      return function()
        go { severity = severity }
      end
    end

    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gs', vim.lsp.buf.signature_help, 'Signature Documentation')
    map('<C-k>', vim.lsp.buf.signature_help, 'Signature Help', 'i')
    map('gd', function()
      Snacks.picker.lsp_definitions()
    end, 'Goto Definition')
    map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

    map('<leader>v', '<cmd>vsplit | lua vim.lsp.buf.definition()<cr>', 'Goto Definition in Vertical Split')

    map(']d', diagnostic_goto(true), 'Next Diagnostic')
    map('[d', diagnostic_goto(false), 'Prev Diagnostic')
    map(']e', diagnostic_goto(true, 'ERROR'), 'Next Error')
    map('[e', diagnostic_goto(false, 'ERROR'), 'Prev Error')
    map(']w', diagnostic_goto(true, 'WARN'), 'Next Warning')
    map('[w', diagnostic_goto(false, 'WARN'), 'Prev Warning')

    local wk = require 'which-key'
    wk.add {
      { '<leader>ca', vim.lsp.buf.code_action, desc = '[C]ode [A]ction' },
      { '<leader>cA', vim.lsp.buf.range_code_action, desc = 'Range Code Actions' },
      { '<leader>cs', vim.lsp.buf.signature_help, desc = 'Display Signature Information' },
      { '<leader>cd', vim.diagnostic.open_float, desc = '[C]ode [D]iagnostics' },
      { '<leader>rn', vim.lsp.buf.rename, desc = 'Rename all references' },
      { '<leader>lf', vim.lsp.buf.format, desc = 'Format' },
    }

    local function client_supports_method(client, method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end

    if client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end
  end,
})
