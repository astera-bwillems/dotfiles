local settings = require("user-conf")
function get_config(name)
    return string.format('require("config/%s")', name)
end

return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')

    use({ "kyazdani42/nvim-web-devicons" })
    use({
        "nvim-lualine/lualine.nvim",
        config = get_config("lualine"),
        event = "VimEnter",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({ "windwp/nvim-autopairs", config = get_config("autopairs") })

    use({ "folke/which-key.nvim", config = get_config("which") })
    use({ "tpope/vim-surround" })
    use({ "tpope/vim-repeat" })


    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }},
        config = get_config("telescope"),
    })
	use({ "jvgrootveld/telescope-zoxide" })
	use({ "nvim-telescope/telescope-symbols.nvim" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	use({ "kyazdani42/nvim-tree.lua", config = get_config("nvim-tree") })

    use({ "ggandor/lightspeed.nvim" })
    use({ "numToStr/Navigator.nvim", config=get_config("navigator")})

    use({
        "nvim-treesitter/nvim-treesitter",
        config = get_config("treesitter"),
        run = ":TSUpdate",
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")

    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-cmdline" },
            { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
        },
        config = get_config("cmp"),
    })

  	use({ "neovim/nvim-lspconfig", config = get_config("lsp") })

    use({ "williamboman/nvim-lsp-installer" })
	use({ "onsails/lspkind-nvim", requires = { "famiu/bufdelete.nvim" } })
    use({
		"ray-x/lsp_signature.nvim",
		require = { "neovim/nvim-lspconfig" },
		config = get_config("lsp-signature"),
	})
	-- requirement for Neogit
	use({
		"sindrets/diffview.nvim",
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
		},
		config = get_config("diffview"),
	})

	use({
		"TimUntersberger/neogit",
		requires = { "nvim-lua/plenary.nvim" },
		cmd = "Neogit",
		config = get_config("neogit"),
	})

	use({ "f-person/git-blame.nvim", config = get_config("git-blame") })

	use({
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		event = "BufReadPre",
		config = get_config("gitsigns"),
	})

--    use({
--		"jose-elias-alvarez/null-ls.nvim",
--		requires = { { "nvim-lua/plenary.nvim" } },
--		config = get_config("null-ls"),
--	})

    use({
        "akinsho/nvim-bufferline.lua",
        requires = "kyazdani42/nvim-web-devicons",
        event = "BufReadPre",
        config = get_config("bufferline"),
    })
    use("famiu/bufdelete.nvim")

	use({ "rafamadriz/friendly-snippets" })
	use({
		"L3MON4D3/LuaSnip",
		requires = "saadparwaiz1/cmp_luasnip",
		config = get_config("luasnip"),
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		config = [[require("config/indent-blankline")]],
	})

    use({
        "kevinhwang91/nvim-bqf",
        requires = {{ "junegunn/fzf", module = "nvim-bqf"}, config = get_config("nvim-bqf")}
    })

	use("p00f/nvim-ts-rainbow")
	use({ "echasnovski/mini.nvim", branch = "stable", config = get_config("mini") })
 	use({ "rcarriga/nvim-notify", config = get_config("notify") })
    use({"edluffy/specs.nvim", config = get_config("specs")})
    use("junegunn/vim-easy-align")
    use({ "mfussenegger/nvim-ts-hint-textobject" })
    use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = get_config("toggleterm")}

	if settings.theme == "nightfox" then
		use({ "EdenEast/nightfox.nvim", config = get_config("nightfox") })
	elseif settings.theme == "catppuccino" then
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	else
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	end

end)
