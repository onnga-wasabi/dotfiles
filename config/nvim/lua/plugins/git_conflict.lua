return {
	-- https://github.com/akinsho/git-conflict.nvim
	"akinsho/git-conflict.nvim",
	opts = {
		default_mappings = false, -- disable buffer local mapping created by this plugin
		default_commands = true, -- disable commands created by this plugin
		disable_diagnostics = true, -- This will disable the diagnostics in a buffer whilst it is conflicted
		highlights = { -- They must have background color, otherwise the default color will be used
			incoming = "DiffText",
			current = "DiffAdd",
		},
	},
	keys = {
		{ "co", "<Plug>(git-conflict-ours)" },
		{ "ct", "<Plug>(git-conflict-theirs)" },
		{ "cb", "<Plug>(git-conflict-both)" },
		{ "c0", "<Plug>(git-conflict-none)" },
		{ "]x", "<Plug>(git-conflict-prev-conflict)" },
		{ "[x", "<Plug>(git-conflict-next-conflict)" },
	},
}
