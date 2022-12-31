local ok, hop = pcall(require, "hop")
if not ok then
	return
end

hop.setup()

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<s-f><s-f>", "<cmd>HopWord<cr>", opts)
set_keymap("n", "<s-f><s-l>", "<cmd>HopLine<cr>", opts)
set_keymap("v", "<s-f><s-f>", "<cmd>HopWord<cr>", opts)
set_keymap("v", "<s-f><s-l>", "<cmd>HopLine<cr>", opts)
