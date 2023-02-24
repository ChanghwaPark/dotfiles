---@type MappingsConfig
local M = {}

M.disabled = {
	n = {
		["<C-h>"] = "",
		["<C-l>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",
	},
}

M.general = {
	n = {
		[";"] = { ":", "enter command line", opts = { nowait = true } },
		["<C-u>"] = { "<C-u>zz", "scroll upwards and center the cursor", opts = { nowait = true } },
		["<C-d>"] = { "<C-d>zz", "scroll downwards and center the cursor", opts = { nowait = true } },
	},
	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
}

-- more keybinds!

return M
