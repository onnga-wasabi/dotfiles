local ok, telescope = pcall(require, "telescope")
if not ok then
	-- not loaded
	return
end

telescope.load_extension("file_browser")
telescope.load_extension("aerial")
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
			"%.ipynb",
		},
	},
	extensions = {
		aerial = {
			-- Display symbols as <root>.<parent>.<symbol>
			show_nesting = {
				["_"] = false, -- This key will be the default
				json = true, -- You can set the option for specific filetypes
				yaml = true,
			},
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
set_keymap("n", "gxw", '<cmd>lua require("telescope.builtin").diagnostics()<cr>', opts)

-- Outlie
set_keymap("n", "<leader>o", '<Cmd>lua require("telescope").extensions.aerial.aerial()<cr>', opts)


-- Teleskan
--- Most used functions
set_keymap("n", "<leader>Zp", "<cmd>Telekasten panel<CR>", opts)
set_keymap("n", "<leader>Zf", "<cmd>Telekasten find_notes<CR>", opts)
set_keymap("n", "<leader>Zg", "<cmd>Telekasten search_notes<CR>", opts)
set_keymap("n", "<leader>Zd", "<cmd>Telekasten goto_today<CR>", opts)
set_keymap("n", "<leader>Zz", "<cmd>Telekasten follow_link<CR>", opts)
set_keymap("n", "<leader>Zn", "<cmd>Telekasten new_note<CR>", opts)
set_keymap("n", "<leader>Zc", "<cmd>Telekasten show_calendar<CR>", opts)
set_keymap("n", "<leader>Zb", "<cmd>Telekasten show_backlinks<CR>", opts)
set_keymap("n", "<leader>ZI", "<cmd>Telekasten insert_img_link<CR>", opts)
--- Call insert link automatically when we start typing a link
-- set_keymap("i", "[[", "<cmd>Telekasten insert_link<CR>", opts)

-- }}} end of Mappings
