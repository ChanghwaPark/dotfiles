---@type MappingsTable
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
		-- Enter command line
		[";"] = { ":", "enter command line", opts = { nowait = true } },

		-- Scroll cursor center
		["<C-u>"] = { "<C-u>zz", "scroll upwards and center the cursor", opts = { nowait = true } },
		["<C-d>"] = { "<C-d>zz", "scroll downwards and center the cursor", opts = { nowait = true } },

		-- Search cursor center
		["n"] = { "nzzzv", "search next and center the cursor" },
		["N"] = { "Nzzzv", "search previous and center the cursor" },

		["x"] = { '"_x', "" },

		-- Increment/decrement
		["+"] = { "<C-a>", "increment" },
		["-"] = { "<C-x>", "decrement" },

		-- Split window
		["ss"] = { ":split<Return>", "horizontal split" },
		["sv"] = { ":vsplit<Return>", "vertical split" },

		-- Move window
		["sh"] = { "<C-w>h", "move left" },
		["sj"] = { "<C-w>j", "move down" },
		["sk"] = { "<C-w>k", "move up" },
		["sl"] = { "<C-w>l", "move right" },

		["<leader>tt"] = {
			function()
				require("base46").toggle_transparency()
			end,
			"toggle transparency",
		},
	},
}

return M
