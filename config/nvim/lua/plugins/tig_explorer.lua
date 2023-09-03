return {
	-- https://github.com/iberianpig/tig-explorer.vim
	"iberianpig/tig-explorer.vim",
	config = function()
		vim.g.tig_explorer_use_builtin_term = 0
	end,
	keys = {
		{ "<leader>t", "<cmd>TigOpenProjectRootDir<cr><c-\\><c-n>i" },
	},
}
