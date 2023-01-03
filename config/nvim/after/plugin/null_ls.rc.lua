local ok, null_ls = pcall(require, "null-ls")
if not ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- scala
	formatting.scalafmt,

	-- python
	formatting.isort,
	formatting.black.with({
		extra_args = { "--line-length=150" },
	}),
	diagnostics.flake8.with({
		extra_args = { "--max-line-length=150" },
	}),
	--diagnostics.mypy,

	-- yaml
	formatting.yamlfmt,
	diagnostics.yamllint.with({
		extra_args = { "--no-warnings" },
	}),

	-- grpc
	formatting.buf,
	diagnostics.buf,

	-- golang
	formatting.goimports,

	-- javascript
	formatting.prettier.with({
		extra_args = {
			"--no-semi",
			"--double-quote",
			"--jsx-double-quote",
		},
	}),
	formatting.eslint_d,
	diagnostics.eslint_d,

	-- lua
	formatting.stylua,
	diagnostics.luacheck.with({
		extra_args = {
			"--formatter",
			"plain",
			"--codes",
			"--ranges",
			"--globals",
			"vim",
			"--ignore",
			"411",
			"--filename",
			"$FILENAME",
			"-",
		},
	}),
}

local options = {
	sources = sources,
}

null_ls.setup(options)

-- Iterm2 を使う場合はprofiles -> keys -> Ecs+
local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- Normal: n
set_keymap("n", "<a-F>", "<cmd>:lua vim.lsp.buf.format({ async = true })<cr>", opts)