return {
	-- https://github.com/mfussenegger/nvim-lint
	"mfussenegger/nvim-lint",
	config = function()
		-- setup linters
		require("lint").linters_by_ft = {
			go = {
				"golangcilint",
				"cspell",
			},
			javascript = {
				"eslint_d",
			},
		}

		-- check lint autocmd
		vim.api.nvim_create_autocmd({
			"BufReadPost",
			"BufWritePre",
		}, {
			callback = function() require("lint").try_lint() end,
		})
	end,
}
