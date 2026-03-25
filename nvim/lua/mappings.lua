require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-s>", "<cmd> w <cr>", { desc = "save file" })

-- Scroll cursor center
map("n", "<C-u>", "<C-u>zz", { desc = "scroll upwards and center the cursor" })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll downwards and center the cursor" })

-- Search cursor center
map("n", "n", "nzzzv", { desc = "search next and center the cursor" })
map("n", "N", "Nzzzv", { desc = "search previous and center the cursor" })

map("n", "x", '"_x', { desc = "delete char without yanking" })

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
map("n", "<leader>rb", function()
	require("gitsigns").reset_buffer()
end, { desc = "Reset buffer" })

map("n", "j", "jzz", { desc = "move down and center the cursor" })
map("n", "k", "kzz", { desc = "move up and center the cursor" })

-- del("i", "<M-Right>")
map("i", "<M-Right>", "<Plug>(copilot-accept-line)", { desc = "Accept the next line of the current suggestion" })

-- Copilot Chat
map("n", "<leader>cc", "<cmd>CopilotChatToggle<cr>", { desc = "CopilotChat Toggle" })
map("n", "<leader>co", "<cmd>CopilotChatOpen<cr>", { desc = "CopilotChat Open" })
map("n", "<leader>cx", "<cmd>CopilotChatClose<cr>", { desc = "CopilotChat Close" })
map("n", "<leader>cr", "<cmd>CopilotChatReset<cr>", { desc = "CopilotChat Reset" })
map("n", "<leader>cp", "<cmd>CopilotChatPrompts<cr>", { desc = "CopilotChat Prompts" })
map("n", "<leader>cm", "<cmd>CopilotChatModels<cr>", { desc = "CopilotChat Models" })

map("v", "<leader>ce", "<cmd>CopilotChatExplain<cr>", { desc = "CopilotChat Explain selection" })
map("v", "<leader>cv", "<cmd>CopilotChatReview<cr>", { desc = "CopilotChat Review selection" })
map("v", "<leader>cf", "<cmd>CopilotChatFix<cr>", { desc = "CopilotChat Fix selection" })
map("v", "<leader>ct", "<cmd>CopilotChatTests<cr>", { desc = "CopilotChat Tests for selection" })

-- Diffview
map("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Diffview open" })
map("n", "<leader>gD", "<cmd>DiffviewClose<cr>", { desc = "Diffview close" })

-- Trouble (diagnostics / quickfix)
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble diagnostics toggle" })
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble quickfix toggle" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble loclist toggle" })
