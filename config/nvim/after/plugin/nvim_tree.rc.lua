local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	return
end

-- 一旦使うのやめてみる
return

-- vim.g.loaded = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- nvim_tree.setup({
-- 	sort_by = "case_sensitive",
-- 	view = {
-- 		adaptive_size = true,
-- 		width = 50,
-- 		mappings = {
-- 			list = {
-- 				{ key = "u", action = "dir_up" },
-- 			},
-- 		},
-- 	},
-- 	renderer = {
-- 		group_empty = true,
-- 	},
-- 	filters = {
-- 		dotfiles = true,
-- 	},
-- })
--
-- local opts = { noremap = true, silent = true }
-- local set_keymap = vim.api.nvim_set_keymap
--
-- set_keymap("n", "<a-b>", "<cmd>NvimTreeToggle<cr>", opts)
