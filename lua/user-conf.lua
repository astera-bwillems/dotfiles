local M = {}

-- theme: catppuccino or nightfox; default is catppuccino
M.theme = "nightfox"
-- Toggle global status line
M.global_statusline = true
-- use rg instead of grep
M.grepprg = "rg --hidden --vimgrep --smart-case --"
-- set numbered lines
M.number = true
-- set relative numbered lines
M.relativenumber = true

return M
