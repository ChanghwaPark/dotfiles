local is_nvim_012 = vim.fn.has("nvim-0.12") == 1

return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
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
				"json-lsp",
				"prettier",

				-- shell
				"shfmt",
				"shellcheck",

				-- python
				"pyright",
				"ruff",
				-- "black",
				-- "isort",
				-- "pylint",
				-- "flake8",
			},
		},
	},

	{
		-- main branch targets Neovim 0.12.0+; master is frozen for <=0.11
		"nvim-treesitter/nvim-treesitter",
		branch = is_nvim_012 and "main" or "master",
		build = is_nvim_012 and function()
			require("nvim-treesitter").install({
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
			}):wait(300000)
		end or ":TSUpdate",
		opts = (not is_nvim_012) and {
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
			indent = { enable = true },
		} or nil,
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

	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown", "copilot-chat" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			file_types = { "markdown", "copilot-chat" },
			overrides = {
				filetype = {
					["copilot-chat"] = {
						heading = { enabled = false },
					},
				},
			},
		},
	},

	-- CSV plugin
	{
		"chrisbra/csv.vim",
		ft = "csv",
	},

	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.g.copilot_assume_mapped = true
			vim.g.copilot_tab_fallback = ""
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"github/copilot.vim",
		},
		build = "make tiktoken",
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatReset",
			"CopilotChatModels",
			"CopilotChatPrompts",
			"CopilotChatExplain",
			"CopilotChatReview",
			"CopilotChatFix",
			"CopilotChatTests",
		},
		opts = {
			model = "gpt-5.3-codex",
			temperature = 0.1,
			-- auto_insert_mode = true,
			window = {
				layout = "vertical",
				width = 80,
			},
			headers = {
				user = "👤 You",
				assistant = "🤖 Copilot",
				tool = "🔧 Tool",
			},
			language = "Korean",
		},
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			enhanced_diff_hl = true,
			view = {
				merge_tool = {
					layout = "diff3_mixed",
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = { focus = true },
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		cmd = "Neogen",
		config = function()
			require("neogen").setup({
				snippet_engine = "nvim",
				enabled = true,
				languages = {
					python = {
						template = {
							-- "google_docstrings" | "numpy_docstrings" | "reST"
							annotation_convention = "google_docstrings",
						},
					},
				},
			})
		end,
	},

	-- Git
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
	},

	{
		"nvim-telescope/telescope-ui-select.nvim",
		event = "VeryLazy",
		config = function()
			local ok, telescope = pcall(require, "telescope")
			if not ok then
				return
			end

			telescope.setup({
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown({}),
				},
			})

			pcall(telescope.load_extension, "ui-select")
		end,
	},
}
