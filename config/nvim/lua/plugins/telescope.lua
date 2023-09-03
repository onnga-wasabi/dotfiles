return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		"nvim-lua/plenary.nvim",
		"stevearc/aerial.nvim",
		"gbprod/yanky.nvim",
		"AckslD/nvim-neoclip.lua",
	},
	opts = {
		defaults = {
			initial_mode = "insert",
			file_ignore_patterns = {
				"node_modules/",
				"submodules/",
				"bundle/",
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
	},
	config = function(_, opts)
		local telescope = require("telescope")

		telescope.load_extension("file_browser")
		telescope.load_extension("aerial")
		telescope.load_extension("neoclip")

		telescope.setup(opts)
	end,
	keys = {
		{ "<leader>p", '<cmd>lua require("telescope.builtin").find_files({ hidden = true })<cr>' },
		{
			"<leader>c",
			'<cmd>lua require("telescope.builtin").find_files({ hidden = true, cwd = vim.fn.expand("~/dotfiles") })<cr>',
		},
		{ "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>' },
		{ "<leader>h", '<cmd>lua require("telescope.builtin").help_tags()<cr>' },
		{ "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>' },
		{
			"<leader>f",
			'<Cmd>lua require("telescope").extensions.file_browser.file_browser({ files = false, hidden = true })<cr>',
		},

		-- Lsp
		{ "<leader>s", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>' },
		{ "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>' },
		{ "gi", '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>' },
		{ "gr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>' },

		-- Trouble
		{ "gxw", '<cmd>lua require("telescope.builtin").diagnostics()<cr>' },

		-- Outlie
		{ "<leader>o", '<cmd>lua require("telescope").extensions.aerial.aerial()<cr>' },

		-- NeoClip
		{ "<leader>y", "<cmd>Telescope neoclip<cr>" },
	},
}
