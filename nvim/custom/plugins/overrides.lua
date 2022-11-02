local M = {}

M.ui = {
  statusline = {
    separator_style = "default", -- default/round/block/arrow

    -- or
    -- custom separators
    -- separator_style = {
    --    left = " ",
    --    right = "",
    --  },

    overriden_modules = nil,
  },

  -- lazyload it when there are 1+ buffers
  tabufline = {
    enabled = true,
    lazyload = true,
    overriden_modules = nil,
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "c",
    "python",
    "rust",
  },
}

M.mason = {
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
}

-- git support in nvimtree
M.nvimtree = {
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
}

return M
