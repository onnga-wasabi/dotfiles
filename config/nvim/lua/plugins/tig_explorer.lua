return {
	-- https://github.com/iberianpig/tig-explorer.vim
	"iberianpig/tig-explorer.vim",
	dependecies = {
		"rbgrouleff/bclose.vim",
	},
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.g.tig_explorer_use_builtin_term = 0

		vim.g.tig_explorer_keymap_edit_e = "e"
		vim.g.tig_explorer_keymap_edit = "<C-o>"
		vim.g.tig_explorer_keymap_tabedit = "<C-t>"
		vim.g.tig_explorer_keymap_split = "<C-s>"
		vim.g.tig_explorer_keymap_vsplit = "<C-v>"
		vim.g.tig_explorer_keymap_commit_edit = "<ESC>o"
		vim.g.tig_explorer_keymap_commit_tabedit = "<ESC>t"
		vim.g.tig_explorer_keymap_commit_split = "<ESC>s"
		vim.g.tig_explorer_keymap_commit_vsplit = "<ESC>v"
	end,
	keys = {
		{ "<leader>t", "<cmd>TigOpenProjectRootDir<cr><c-\\><c-n>i" },
	},
}
