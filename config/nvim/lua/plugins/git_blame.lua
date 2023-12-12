return {
	-- https://github.com/f-person/git-blame.nvim
	"f-person/git-blame.nvim",
	opts = {
		enable = true,
	},
	config = function(_, opts)
		vim.g.gitblame_virtual_text_column = 100
		vim.g.gitblame_ignored_filetypes = {
			"octo",
		}

		local git_blame = require("gitblame")
		git_blame.setup(opts)
	end,
}
