local ok, git_conflict = pcall(require, "git-conflict")
if not ok then
	return
end

local config = {
	default_mappings = false, -- disable buffer local mapping created by this plugin
	default_commands = true, -- disable commands created by this plugin
	disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
	highlights = { -- They must have background color, otherwise the default color will be used
		incoming = "DiffText",
		current = "DiffAdd",
	},
}

git_conflict.setup(config)

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "co", "<Plug>(git-conflict-ours)", opts)
set_keymap("n", "ct", "<Plug>(git-conflict-theirs)", opts)
set_keymap("n", "cb", "<Plug>(git-conflict-both)", opts)
set_keymap("n", "c0", "<Plug>(git-conflict-none)", opts)
set_keymap("n", "]x", "<Plug>(git-conflict-prev-conflict)", opts)
set_keymap("n", "[x", "<Plug>(git-conflict-next-conflict)", opts)
