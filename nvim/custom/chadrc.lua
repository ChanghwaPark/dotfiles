-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme_toggle = { "nightfox", "monekai" },
  theme = "nightfox",
  transparency = true,
}

M.plugins = require "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
