vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_hide_schemas = { "pg_catalog", "pg_toast_temp.*", "pg_toast", "information_schema" }

vim.g.dbs = {
	local_ = "postgres://postgres:secret@127.0.0.1:5432/postgres",
}

local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "<c-j>", "<Plug>(DBUI_ExecuteQuery)", opts)
