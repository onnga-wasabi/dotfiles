local ok, sidebar = pcall(require, "sidebar-nvim")
if not ok then
	return
end

sidebar.setup({
	disable_default_keybindings = 0,
	bindings = nil,
	open = false,
	side = "left",
	initial_width = 50,
	hide_statusline = false,
	update_interval = 1000,
	sections = {
		"git",
		"diagnostics",
		"files",
		"containers",
		"todos",
	},
	section_separator = { "", "-----", "" },
	section_title_separator = { "" },
	containers = {
		attach_shell = "/bin/sh",
		show_all = true,
		interval = 5000,
	},
	datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
	todos = { ignored_paths = { "~" } },
	files = {
		icon = "",
		show_hidden = false,
		ignored_paths = { "%.git$" },
	},
})

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<a-s>", "<cmd>SidebarNvimToggle<cr>", opts)
