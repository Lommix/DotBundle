vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	-- packer & libs{{{
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim") -- }}}
	-- colorschemes{{{
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")
	use("catppuccin/vim")
	use("marko-cerovac/material.nvim")
	use("rebelot/kanagawa.nvim")
	use("bluz71/vim-nightfly-guicolors")
	use("liuchengxu/space-vim-dark")
	use("ray-x/aurora")
	use("elvessousa/sobrio")
	use("EdenEast/nightfox.nvim") -- }}}
	-- telescope{{{
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-live-grep-args.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- }}}
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					["C-q"] = "actions.close",
				},
			})
		end,
	})
	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})
	use("f-person/git-blame.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("NTBBloodbath/rest.nvim")
	use("ThePrimeagen/harpoon")
	use("numToStr/Comment.nvim")
	use("rafamadriz/friendly-snippets")
	use("simrat39/rust-tools.nvim")

	-- ai
	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})
	use("Exafunction/codeium.vim")

	-- stuff
	use("nvim-lua/lsp-status.nvim")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	use({
		"epwalsh/obsidian.nvim",
		config = function()
			require("obsidian").setup({
				dir = "~/my-vault",
				-- see below for full list of options 👇
			})
		end,
	})
	-- ui
	use("brenoprata10/nvim-highlight-colors")
	-- lsp

	use({
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
		end,
	})

	use("mfussenegger/nvim-dap")
	use("leoluz/nvim-dap-go")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("ray-x/lsp_signature.nvim")
	use("SmiteshP/nvim-navic")
	use("simrat39/symbols-outline.nvim")
	use("b0o/SchemaStore.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("glepnir/lspsaga.nvim")
	use("lvimuser/lsp-inlayhints.nvim")
	use("fladson/vim-kitty")
	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("vim-autoformat/vim-autoformat")
	use("L3MON4D3/LuaSnip")
	use("nvim-lualine/lualine.nvim")

	use("tpope/vim-fugitive")
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("famiu/nvim-reload")
	use("christianchiarulli/lua-dev.nvim")
	use("akinsho/toggleterm.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use({
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				override = {
					zsh = {
						icon = "",
						color = "#428850",
						cterm_color = "65",
						name = "Zsh",
					},
				},
				default = true,
			})
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
		config = function()
			vim.g.loaded = 1
			vim.g.loaded_netrwPlugin = 1
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					adaptive_size = true,
				},
				renderer = {
					group_empty = true,
					icons = {
						show = {
							git = true,
						},
					},
				},
				filters = {
					dotfiles = false,
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
				git = {
					enable = true,
					ignore = false,
				},
			})
		end,
	})
end)
