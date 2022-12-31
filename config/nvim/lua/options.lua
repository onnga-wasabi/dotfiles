local options = {
	encoding = "utf-8",
	fileencoding = "utf-8",
	title = true,

	ignorecase = true,
	smartcase = true,

	backup = false,
	writebackup = false,
	swapfile = false,

	autoindent = true,
	smartindent = true,
	cindent = true,
	expandtab = true,

	termguicolors = true,
	cursorline = true,
	number = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	showtabline = 2,
	shiftwidth = 2,
	tabstop = 2,

	timeoutlen = 300,
	updatetime = 300,

	laststatus = 3,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
