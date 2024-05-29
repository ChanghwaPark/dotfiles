require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-s>", "<cmd> w <cr>")

-- Scroll cursor center
map("n", "<C-u>", "<C-u>zz", { desc = "scroll upwards and center the cursor" })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll downwards and center the cursor" })

-- Search cursor center
map("n", "n", "nzzzv", { desc = "search next and center the cursor" })
map("n", "N", "Nzzzv", { desc = "search previous and center the cursor" })

map("n", "x", '"_x', { desc = "" })

-- Increment/decrement
map("n", "+", "<C-a>", { desc = "increment" })
map("n", "-", "<C-x>", { desc = "decrement" })

-- Split window
map("n", "ss", ":split<Return>", { desc = "horizontal split" })
map("n", "sv", ":vsplit<Return>", { desc = "vertical split" })

-- Move window
map("n", "sh", "<C-w>h", { desc = "move left" })
map("n", "sj", "<C-w>j", { desc = "move down" })
map("n", "sk", "<C-w>k", { desc = "move up" })
map("n", "sl", "<C-w>l", { desc = "move right" })

map("n", "zj", "o<Esc>k", { desc = "insert a new line under the cursor" })
map("n", "zk", "O<Esc>j", { desc = "insert a new line above the cursor" })

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "toggle transparency" })

map("n", "]c", function()
  if vim.wo.diff then
    return "]c"
  end
  vim.schedule(function()
    require("gitsigns").next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to next hunk", expr = true })
map("n", "[c", function()
  if vim.wo.diff then
    return "[c"
  end
  vim.schedule(function()
    require("gitsigns").prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump to prev hunk", expr = true })

map("n", "<leader>rh", function()
  require("gitsigns").reset_hunk()
end, { desc = "Reset hunk" })
map("n", "<leader>ph", function()
  require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
