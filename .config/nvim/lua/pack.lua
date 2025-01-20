-- Packages
return require("packer").startup(function(use)
	-- LSP
	use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
	use{'neovim/nvim-lspconfig'}
	use{'hrsh7th/nvim-cmp'}
	use{'hrsh7th/cmp-nvim-lsp'}
	use{'hrsh7th/cmp-nvim-lsp-signature-help'}

	use "HoNamDuong/hybrid.nvim"
	use {
		"rockyzhang24/arctic.nvim",
		requires = { "rktjmp/lush.nvim" }
	}

	use "wbthomason/packer.nvim"
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)

