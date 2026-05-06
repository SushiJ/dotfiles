---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
local M = {}
---@param repo string
---@return string
M.gh = function(repo) return 'https://github.com/' .. repo end

return M
