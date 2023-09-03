return {
	-- https://github.com/akinsho/toggleterm.nvim
	"akinsho/toggleterm.nvim",
	opts = {
		close_on_exit = true, -- close the terminal window when the process exits
	},
	keys = {
		{ "<a-t>", "<cmd>ToggleTerm direction=float<cr>" },
		{ "<a-t>", "<cmd>ToggleTerm direction=float<cr>", mode = "t" },
	},
}
