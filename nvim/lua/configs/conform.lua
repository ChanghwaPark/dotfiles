local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		markdown = { "prettier" },
		-- python = { "isort", "black", "pylint", "flake8" },
		python = { "isort", "black" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 5000,
		lsp_fallback = true,
	},
}

require("conform").setup(options)
