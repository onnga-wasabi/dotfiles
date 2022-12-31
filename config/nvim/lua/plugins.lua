local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- highlints
	use({ "joshdick/onedark.vim" })
	use({ "cocopon/iceberg.vim" })
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use({ "akinsho/bufferline.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })

	-- telescope
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim", opt = true } })
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- lsp
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })
	use({ "folke/trouble.nvim" })
	use({ "jose-elias-alvarez/null-ls.nvim" })

	-- completion core
	use({ "hrsh7th/nvim-cmp" })

	-- completion sources
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })

	use({ "hrsh7th/cmp-vsnip" }) -- snippet
	use({ "hrsh7th/vim-vsnip" }) -- snippet

	-- enhancement ui with lsp
	use({ "onsails/lspkind.nvim" }) -- 補完候補にアイコンつける
	use({ "glepnir/lspsaga.nvim" }) -- ゴリゴリIDEパワー

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "yioneko/nvim-yati", requires = "nvim-treesitter/nvim-treesitter" })

	-- autopairs
	use({ "windwp/nvim-autopairs" })
	use({ "windwp/nvim-ts-autotag" })

	-- terminal
	use({ "akinsho/nvim-toggleterm.lua" })

	-- filetree
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "sidebar-nvim/sidebar.nvim" })

	-- jump
	use({ "phaazon/hop.nvim" })

	-- packer restriction
	if packer_bootstrap then
		require("packer").sync()
	end
end)
