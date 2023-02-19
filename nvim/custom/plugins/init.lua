local overrides = require("custom.plugins.overrides")

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {
	-- Enable dashboard
	["goolord/alpha-nvim"] = {
		disable = false,
	},

	-- ["folke/which-key.nvim"] = {
	-- 	disable = false,
	-- },

	-- Override plugin definition options
	["NvChad/ui"] = {
		override_options = overrides.ui,
	},

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- override plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	-- Override plugin configs
	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["nvim-tree/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- install without yarn or npm
	["iamcco/markdown-preview.nvim"] = {
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Install a plugin
	-- ["tzachar/cmp-tabnine"] = {
	--   after = "nvim-cmp",
	--   run = "./install.sh",
	--   config = function()
	--     require "custom.plugins.tabnine"
	--   end,
	-- },
	-- ["ckipp01/stylua-nvim"] = {
	--   config = function()
	--     require("better_escape").setup()
	--   end,
	-- },

	-- Code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},
	-- load it after nvim-lspconfig because we lazy loaded lspconfig

	-- Remove plugin
	-- ["hrsh7th/cmp-path"] = false,
}

return plugins
