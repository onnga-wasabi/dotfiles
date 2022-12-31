local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Normal: n
set_keymap("n", "j", "gj", opts)
set_keymap("n", "k", "gk", opts)
set_keymap("n", "<c-s>", "<c-i>", opts)
set_keymap("n", "<c-w>n", "<nop>", opts)
set_keymap("n", "<c-c>", "<cmd>noh<cr>", opts)
set_keymap("n", "<c-p>", '<cmd>echo expand("%")<cr>', opts)

-- Insert: i
set_keymap("i", "<c-c>", "<esc>", opts)

-- Visual: v
set_keymap("v", "<", "<gv", opts)
set_keymap("v", ">", ">gv", opts)

-- Visual Block: x
-- Terminal: t
-- Command: c
