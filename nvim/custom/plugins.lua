local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-- Install a plugin
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- CSV plugin
	{
		"chrisbra/csv.vim",
	},

	-- Tabnine AI assistant
	{
		"codota/tabnine-nvim",
		lazy = false,
		build = "./dl_binaries.sh",
		config = function()
			require("custom.configs.tabnine")
		end,
	},

	-- Git
	{
		"tpope/vim-fugitive",
		lazy = false,
	},

	-- Debugging
	{
		"mfussenegger/nvim-dap",
		-- lazy = false,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("mfussenegger/nvim-dap")
		end,
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },
}

return plugins
