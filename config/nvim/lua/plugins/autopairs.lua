return {
	-- https://github.com/windwp/nvim-autopairs
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		disable_filetype = { "TelescopePrompt" },
	},
}
