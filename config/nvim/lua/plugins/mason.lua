return {
	-- https://github.com/williamboman/mason.nvim
	"williamboman/mason.nvim",
	opts = {
		ensure_installed = {
			"black",
			"buf",
			"buf-language-server",
			"clangd",
			"dockerfile-language-server",
			"emmet-ls",
			"flake8",
			"gopls",
			"groovy-language-server",
			"isort",
			"jdtls", -- java
			"kotlin-language-server",
			"ltex-ls",
			"lua-language-server",
			"marksman",
			"opencl-language-server",
			"prettier",
			"pyright",
			"robotframework-lsp",
			"shfmt",
			"stylua",
			"taplo",
			"terraform-ls",
			"texlab",
			"typescript-language-server",
			"vim-language-server",
			"vue-language-server",
			"yaml-language-server",
			"yamlfmt",
			"yamllint",
		},
	},
	build = ":MasonUpdate",
	---@param opts MasonSettings | {ensure_installed: string[]}
	config = function(_, opts)
		require("mason").setup(opts)
		local mr = require("mason-registry")
		local function ensure_installed()
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end
		if mr.refresh then
			mr.refresh(ensure_installed)
		else
			ensure_installed()
		end
	end,
}
