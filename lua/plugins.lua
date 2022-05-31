local settings = require("user-conf")
local function get_config(name)
    return string.format('require("config/%s")', name)
end

return require('packer').startup(function(use)
    use("wbthomason/packer.nvim")

    use({ "tweekmonster/startuptime.vim" })

    -- Look and feel
    use({ "kyazdani42/nvim-web-devicons" })
    use({
        "nvim-lualine/lualine.nvim",
        config = get_config("lualine"),
        event = "VimEnter",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = get_config("indent-blankline"),
	})

    -- LSP + TS
    use({ "neovim/nvim-lspconfig", config = get_config("lsp") })
    use({ "williamboman/nvim-lsp-installer" })
    use({
        "nvim-treesitter/nvim-treesitter",
        config = get_config("treesitter"),
        run = ":TSUpdate",
    })

    -- LSP Completion + snip
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
        },
        config = get_config("cmp"),
    })
  	use({ "rafamadriz/friendly-snippets" })
    use({
		"L3MON4D3/LuaSnip",
		requires = "saadparwaiz1/cmp_luasnip",
		config = get_config("luasnip"),
	})


    -- Mobility
    use({
        "nvim-telescope/telescope.nvim",
        requires = {{ "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }},
        config = get_config("telescope"),
    })
   	use({ "nvim-telescope/telescope-symbols.nvim" })
   	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({ "nvim-telescope/telescope-file-browser.nvim" })

   	use({ "numToStr/Navigator.nvim", config = get_config("navigator") })
    use({
		"ThePrimeagen/harpoon",
		requires = { "nvim-lua/plenary.nvim" },
		config = get_config("harpoon"),
	})
    use({
        "akinsho/nvim-bufferline.lua",
        tag = "v2.*",
        requires = "kyazdani42/nvim-web-devicons",
        event = "BufReadPre",
        config = get_config("bufferline"),
    })
    use({ "famiu/bufdelete.nvim" })
    use({ "ggandor/lightspeed.nvim" })
    use({ "mfussenegger/nvim-ts-hint-textobject" })
	use({ "ironhouzi/starlite-nvim" })

    -- Editing
    use({ "tpope/vim-surround" })
    use({ "tpope/vim-repeat" })
    use({ "windwp/nvim-autopairs", config = get_config("autopairs") })
    use("junegunn/vim-easy-align") -- no lua alternative
    use {
      "folke/which-key.nvim",
      config = get_config("which")
    }

    -- Theme
    if settings.theme == "nightfox" then
		use({ "EdenEast/nightfox.nvim", config = get_config("nightfox") })
	elseif settings.theme == "catppuccino" then
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	else
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	end
end)
