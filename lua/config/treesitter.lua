
require"nvim-treesitter.configs".setup({
    ensure_installed = {
        "bash", "cmake", "lua", "python", "markdown", "c", "fish"
    },
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {}
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>"
        }
    },
    indent = {enable = true},
})
