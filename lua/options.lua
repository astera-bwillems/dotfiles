local settings = require("user-conf")
local utils = require("functions")
local o = vim.opt

vim.cmd("set inccommand=split")
o.guicursor = "n-v-c-sm:block-blinkwait50-blinkon50-blinkoff50,i-ci-ve:ver25-Cursor-blinkon100-blinkoff100,r-cr-o:hor20"
o.updatetime = 300
o.timeoutlen = 400
o.ttimeoutlen = 0
o.backup = false
o.swapfile = false
o.clipboard = "unnamedplus"
o.cursorline = true
o.cursorcolumn = false
o.history = 500
o.encoding = "utf-8"
o.fileencoding = "utf-8"
o.expandtab = true
o.ignorecase = true
o.mouse = "a"
o.number = settings.number
o.relativenumber = settings.relativenumber
o.cmdheight = 1
o.showmode = false
o.showtabline = 2
o.hlsearch = true
o.expandtab = true
o.background = "dark"
o.lazyredraw = true
o.showcmd = true
o.wrap = true
o.smarttab = true
o.smartindent = true
o.smartcase = true
o.tabstop = 4
o.shiftwidth = 4
o.splitbelow = true
o.splitright = true
o.writebackup = false
o.scrolloff = 8
o.sidescrolloff = 8
o.formatoptions = "l"
o.signcolumn = "yes"
o.colorcolumn = "80"
o.list = true
o.listchars = "eol:¬,tab:>·,trail:~,extends:>,precedes:<,"
o.termguicolors = true
o.wildmode = "full"
o.title = true
o.completeopt = { "menu" , "menuone", "noselect", "noinsert" }
o.foldenable = false
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.shortmess = o.shortmess + "c"
o.wildignorecase = true
if (settings.global_statusline) then
    o.laststatus = 3
else
    o.laststatus = 2
end

if utils.isNotEmpty(settings.grepprg) then
    o.grepprg = settings.grepprg
end
