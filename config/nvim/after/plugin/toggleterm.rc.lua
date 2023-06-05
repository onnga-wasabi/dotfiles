local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
	return
end

toggleterm.setup({
	close_on_exit = true, -- close the terminal window when the process exits
})

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<a-t>", "<cmd>ToggleTerm direction=float<cr>", opts)
set_keymap("t", "<a-t>", "<cmd>ToggleTerm direction=float<cr>", opts)
