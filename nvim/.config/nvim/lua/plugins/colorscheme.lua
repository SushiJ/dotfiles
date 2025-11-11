local hour = function()
  return os.date('*t').hour
end

local style = function()
  if hour() >= 18 or hour() < 12 then
    return 'dark'
  else
    return 'light'
  end
end

return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = style(),
      }
      require('onedark').load()
    end,
  },
}
