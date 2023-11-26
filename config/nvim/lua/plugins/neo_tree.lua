return {
	-- https://github.com/nvim-neo-tree/neo-tree.nvim
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{ "<m-s>", "<cmd>Neotree toggle<cr>" },
	},
}
