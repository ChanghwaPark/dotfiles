require "nvchad.options"

-- add yours here!

local o = vim.opt
o.cursorlineopt = "both" -- to enable cursorline!
o.relativenumber = true
o.clipboard = "unnamedplus"

local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

local enable_providers = {
  "python3_provider",
  "node_provider",
  -- and so on
}

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end

vim.g["python3_host_prog"] = "/home/dexter/miniconda3/bin/python3"

vim.g.clipboard = {
  name = 'tmux',
  copy = {
    ["+"] = {'tmux', 'load-buffer', '-w', '-'},
    ["*"] = {'tmux', 'load-buffer', '-w', '-'},
  },
  paste = {
    ["+"] = {'tmux', 'save-buffer', '-'},
    ["*"] = {'tmux', 'save-buffer', '-'},
  },
  cache_enabled = 0,
}
