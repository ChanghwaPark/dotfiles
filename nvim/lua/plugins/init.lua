return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		config = function()
			require("configs.conform")
		end,
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lua stuff
				"lua-language-server",
				"stylua",

				-- web dev stuff
				"css-lsp",
				"html-lsp",
				"typescript-language-server",
				"deno",
				"emmet-ls",
				"json-lsp",
				"prettier",

				-- shell
				"shfmt",
				"shellcheck",

				-- python
				"pyright",
				"black",
				"isort",
				"pylint",
				"flake8",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"javascript",
				"c",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
			},
			indent = {
				enable = true,
				-- disable = {
				--   "python"
				-- },
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = {
				enable = true,
			},

			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		},
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
		ft = "csv",
	},

	-- Tabnine AI assistant
	-- {
	-- 	"codota/tabnine-nvim",
	-- 	lazy = false,
	-- 	build = "./dl_binaries.sh",
	-- 	config = function()
	-- 		require("configs.tabnine")
	-- 	end,
	-- },

	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
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
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
	},
	{
		"theHamsta/nvim-dap-virtual-text",
	},
	{
		"nvim-telescope/telescope-dap.nvim",
	},
	{
		"mfussenegger/nvim-dap-python",
	},
}
