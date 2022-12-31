local ok, bufferline = pcall(require, "bufferline")
if not ok then
	return
end

local options = {
	mode = "buffer",
	separator_style = "slant",
	always_show_bufferline = true,
	show_buffer_close_icons = false,
	show_close_icon = false,
	color_icons = true,
}

local highlights = {
	separator = {
		fg = "#000000",
		bg = "#1B1E23",
	},
	background = {
		fg = "#fbf6e3",
		bg = "#1B1E23",
	},
	separator_selected = {
		fg = "#000000",
		bg = "#1E2127",
	},
	buffer_selected = {
		fg = "#fbf6e3",
		bg = "#1E2127",
	},
	fill = {
		bg = "#000000",
	},
}
bufferline.setup({
	options = options,
	highlights = highlights,
})

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<tab>", "<cmd>BufferLineCycleNext<cr>", opts)
set_keymap("n", "<s-tab>", "<cmd>BufferLineCyclePrev<cr>", opts)
