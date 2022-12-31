local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "gs", "<cmd>Gdiffsplit<cr><c-w>l", opts)
