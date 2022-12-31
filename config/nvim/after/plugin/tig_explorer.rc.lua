vim.g.tig_explorer_use_builtin_term = 0

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Normal: n
set_keymap("n", "<leader>T", ":on<cr><cmd>TigOpenCurrentFile<cr><c-\\><c-n>:set nonumber<cr>i", opts)
set_keymap("n", "<leader>t", ":on<cr><cmd>TigOpenProjectRootDir<cr><c-\\><c-n>:set nonumber<cr>i", opts)
