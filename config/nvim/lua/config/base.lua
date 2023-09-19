-- Mappings {{{
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " " -- Set <Space> as <Leader>
vim.g.omni_sql_no_default_maps = 1

-- basic shortcuts
set_keymap("n", "<c-w>n", "<nop>", opts)
set_keymap("n", "s", "<nop>", opts)
set_keymap("n", "j", "gj", opts)
set_keymap("n", "k", "gk", opts)
set_keymap("n", "<c-c>", "<cmd>noh<cr>:w<cr>", opts)
set_keymap("n", "<c-p>", '<cmd>echo expand("%")<cr>', opts)
set_keymap("n", "<leader>r", "<cmd>source ~/.config/nvim/init.lua<cr>", opts)

-- windows and buffers
set_keymap("n", "<c-w>v", "<c-w>v<c-w>l", opts)
set_keymap("n", "<c-w>s", "<c-w>s<c-w>j", opts)

set_keymap("n", "<c-w>l", "<cmd>silent! w<cr><c-w>l", opts)
set_keymap("n", "<c-w>j", "<cmd>silent! w<cr><c-w>j", opts)
set_keymap("n", "<c-w>k", "<cmd>silent! w<cr><c-w>k", opts)
set_keymap("n", "<c-w>h", "<cmd>silent! w<cr><c-w>h", opts)
set_keymap("n", "<c-o>", "<cmd>silent! w<cr><c-o>", opts)
set_keymap("n", "<c-s>", "<cmd>silent! w<cr><c-i>", opts)

set_keymap("v", "<c-w>l", "<cmd>silent! w<cr><c-w>l", opts)
set_keymap("v", "<c-w>j", "<cmd>silent! w<cr><c-w>j", opts)
set_keymap("v", "<c-w>k", "<cmd>silent! w<cr><c-w>k", opts)
set_keymap("v", "<c-w>h", "<cmd>silent! w<cr><c-w>h", opts)
set_keymap("v", "<c-o>", "<cmd>silent! w<cr><c-o>", opts)
set_keymap("v", "<c-s>", "<cmd>silent! w<cr><c-i>", opts)

-- cursor
set_keymap("n", "<c-f>", "<c-f>zz", opts)
set_keymap("n", "<c-b>", "<c-b>zz", opts)
set_keymap("v", "<c-f>", "<c-f>zz", opts)
set_keymap("v", "<c-b>", "<c-b>zz", opts)

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

-- cusor 記憶
vim.cmd([[
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif
]])

-- refer to: https://lsifrontend.blog.fc2.com/blog-entry-356.html?sp
vim.cmd([[
" ウィンドウを閉じずにバッファを閉じる
command! Ebd call EBufdelete()
function! EBufdelete()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if buflisted(l:currentBufNum)
    execute "silent bwipeout".l:currentBufNum
    " bwipeoutに失敗した場合はウインドウ上のバッファを復元
    if bufloaded(l:currentBufNum) != 0
      execute "buffer " . l:currentBufNum
    endif
  endif
endfunction
]])
set_keymap("n", ",", "<cmd>silent! w<cr><cmd>Ebd<cr>", opts)

-- Preview PlantUML
set_keymap("n", "<c-w>l", "<cmd>silent! w<cr><c-w>l", opts)
