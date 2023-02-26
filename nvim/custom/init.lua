vim.o.relativenumber = true

local autocmd = vim.api.nvim_create_autocmd

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

-- vim.g["python3_host_prog"] = "/usr/bin/python3"
-- vim.g["python3_host_prog"] = "/home/prosper/anaconda3/bin/python3"
-- vim.g["python3_host_prog"] = "/home/prosper/anaconda3/envs/patchcore/bin/python3"
