local ok, telescope = pcall(require, "telescope")
if not ok then
	-- not loaded
	return
end

telescope.load_extension("file_browser")
telescope.setup({
	defaults = {
		initial_mode = "insert",
		file_ignore_patterns = {
			"node_modules/",
			"submodules/",
			".git/",
			"%.tmp/*",
			"%.jpg",
			"%.jpeg",
			"%.png",
			"%.zip",
			"%.tar",
			"%.tar.gz",
			".tmp/",
			"%.gradle/",
			"%.metals/",
			"%.class",
			"%.jar",
			"%.csv",
			"%mocks/",
			"%.pb.go",
			"%.pyi",
			"%__pycache__/*",
			"%.xlsx",
		},
	},
})

-- Mappings {{{
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- option を渡す場合にはマップしたキーが押下されたタイミングで実行される処理を渡すので require から書く
set_keymap("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
set_keymap(
	"n",
	"<leader>d",
	'<cmd>lua require("telescope.builtin").find_files({ hidden = true, cwd = vim.fn.expand("~/dotfiles") })<cr>',
	opts
)
set_keymap("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
set_keymap("n", "<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
set_keymap("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
set_keymap(
	"n",
	"<leader>f",
	'<Cmd>lua require("telescope").extensions.file_browser.file_browser({ files = false })<cr>',
	opts
)

-- Lsp
set_keymap("n", "<leader>s", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>', opts)
set_keymap("n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>', opts)
set_keymap("n", "gi", '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>', opts)
set_keymap("n", "gr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>', opts)

-- Trouble
set_keymap("n", "gxx", '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)
-- }}} end of Mappings
