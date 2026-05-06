return {
  'stevearc/oil.nvim',
  opts = {
    skip_confirm_for_simple_edits = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git' or name == 'node_modules'
      end,
    },
    float = {
      max_width = 100,
      max_height = 100,
    },
  },
}
