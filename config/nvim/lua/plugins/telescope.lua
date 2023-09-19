return {
	-- https://github.com/nvim-telescope/telescope.nvim
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
				"_mock.go",
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
		{ "<leader>p", function() require("telescope.builtin").find_files({ hidden = true }) end },
		{ "<leader>c", function() require("telescope.builtin").find_files({ hidden = true, cwd = vim.fn.expand("~/dotfiles") }) end },
		{ "<leader>b", function() require("telescope.builtin").buffers() end },
		{ "<leader>h", function() require("telescope.builtin").help_tags() end },
		{ "<leader>g", function() require("telescope.builtin").live_grep() end },
		{ "<leader>f", function() require("telescope").extensions.file_browser.file_browser({ files = false, hidden = true }) end },

		-- Lsp
		{ "<leader>s", function() require("telescope.builtin").lsp_document_symbols() end },
		{ "gd", function() require("telescope.builtin").lsp_definitions() end },
		{ "gi", function() require("telescope.builtin").lsp_implementations() end },
		{ "gr", function() require("telescope.builtin").lsp_references() end },

		-- Trouble
		{ "gxw", function() require("telescope.builtin").diagnostics() end },

		-- Outlie
		{ "<leader>o", function() require("telescope").extensions.aerial.aerial() end },

		-- NeoClip
		{ "<leader>y", function() require("telescope").extensions.neoclip.neoclip() end },
	},
}
