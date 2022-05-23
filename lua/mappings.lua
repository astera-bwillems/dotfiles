-- more mappings are defined in `lua/config/which.lua`
local function map(mode, lhs, rhs, opts)
    local options = { silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

expr_options = { expr = true, silent = true }

-- remap space as leader key
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_options)
map("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_options)

-- jk to escape
map("i", "jk", "<ESC>")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over selection without yanking
map("v", "p", '"_dP')

-- tab switch buffer
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")

-- cancel search highlighting with ESC
map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>")

-- resizing panes
map("n", "<Left>", ":vertical resize +2<CR>")
map("n", "<Right>", ":vertical resize -2<CR>")
map("n", "<Up>", ":resize -2<CR>")
map("n", "<Down>", ":resize +2<CR>")

-- move selection in visual mode
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "J", ":move '>+1<CR>gv-gv")


-- move over a closing element in insert mode
map("i", "<C-l>", function()
    return require("functions").escapePair()
end)
