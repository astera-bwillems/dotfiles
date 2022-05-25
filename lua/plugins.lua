local settings = require("user-conf")
function get_config(name)
    return string.format('require("config/%s")', name)
end

return require('packer').startup(function(use)
    use("wbthomason/packer.nvim")

    use({ "tweekmonster/startuptime.vim" })
    use({ "kyazdani42/nvim-web-devicons" })

    if settings.theme == "nightfox" then
		use({ "EdenEast/nightfox.nvim", config = get_config("nightfox") })
	elseif settings.theme == "catppuccino" then
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	else
		use({ "catppuccin/nvim", as = "catppuccin", config = get_config("catppuccin") })
	end
end)
