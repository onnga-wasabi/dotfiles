-- Mappings {{{
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " " -- Set <Space> as <Leader>

-- basic shortcuts
set_keymap("n", "<c-w>n", "<nop>", opts)
set_keymap("n", "s", "<nop>", opts)

set_keymap("n", "j", "gj", opts)
set_keymap("n", "k", "gk", opts)
set_keymap("n", "<c-s>", "<c-i>", opts)
set_keymap("n", "<c-c>", "<cmd>noh<cr>", opts)
set_keymap("n", "<c-p>", '<cmd>echo expand("%")<cr>', opts)
set_keymap("n", "<leader>r", "<cmd>source ~/.config/nvim/init.lua<cr>", opts)

-- windows and buffers
set_keymap("n", "<c-w>v", "<c-w>v<c-w>l", opts)
set_keymap("n", "<c-w>s", "<c-w>s<c-w>j", opts)

set_keymap("n", ",", "<cmd>bp<bar>sp<bar>bn<bar>bd<cr>", opts)
set_keymap("n", "sp", "<cmd>bn<cr>", opts)
set_keymap("n", "sn", "<cmd>bp<cr>", opts)

set_keymap("i", "<c-c>", "<esc>", opts)

set_keymap("v", "<", "<gv", opts)
set_keymap("v", ">", ">gv", opts)

-- Terminals
set_keymap("t", "<c-n>", "<c-\\><c-n>", opts)
-- }}} end of Mappings

-- Util Functions {{{
-- Open memo file
vim.cmd("autocmd!")
vim.api.nvim_create_user_command("Memo", function(_)
	vim.cmd("e " .. "~/._/memo/memo.md")
end, {})
-- }}} end of Util Functions

-- File Types
vim.cmd([[au BufNewFile,BufRead *.rb,*.rbw,Brewfile        setf ruby]])
