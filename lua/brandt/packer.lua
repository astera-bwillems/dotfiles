return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  --use {
  --  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  ---- or                            , branch = '0.1.x',
  --  requires = { {'nvim-lua/plenary.nvim'} },
  --}
  --use({ "nvim-telescope/telescope-symbols.nvim" })
  --use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  --use({ "nvim-telescope/telescope-file-browser.nvim" })

  use({
    'nvim-treesitter/nvim-treesitter',
    commit = 'eadfcad580edc74b258dc13u0f1e3edea35cc6d4',
    run = ':TSUpdate'
  })
  --use("romgrk/nvim-treesitter-context")

  -- Look and feel
  --use({ "kyazdani42/nvim-web-devicons" })
 -- use({
 --     "nvim-lualine/lualine.nvim",
 --     event = "VimEnter",
 --     requires = { "kyazdani42/nvim-web-devicons", opt = true },
 -- })
 -- use({
 --   "lukas-reineke/indent-blankline.nvim",
 -- })

  -- Theme
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    config = function()
        vim.cmd('colorscheme rose-pine')
    end
  })
end)
