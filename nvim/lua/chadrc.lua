-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	h1_add = {
		NvimTreeOpenedFolderName = { fg = "green", bold = true },
	},
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},

	theme_toggle = { "monekai", "nightfox", "onedark", "one_light" },
	theme = "monekai",
	transparency = true,

	statusline = {
		theme = "vscode_colored", -- default/vscode/vscode_colored/minimal

		-- default/round/block/arrow (separators work only for "default" statusline theme;
		-- round and block will work for the minimal theme only)
		separator_style = "default",
		overriden_modules = nil,
	},

	nvdash = {
		load_on_startup = true,
	},
}

return M
