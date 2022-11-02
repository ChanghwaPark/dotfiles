local M = {}

M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  }
}

M.general = {
  n = {
    [";"] = { ":", "enter command line", opts = { nowait = true } },
  },
  i = {
    ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },
}


-- more keybinds!

return M
