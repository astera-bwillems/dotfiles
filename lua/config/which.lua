require("which-key").setup(
    {
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        key_labels = {
            -- override the label used to display some keys. It doesn't effect WK in any other way.
            -- For example:
            -- ["<space>"] = "SPC",
            -- ["<cr>"] = "RET",
            -- ["<tab>"] = "TAB",
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
            scroll_down = '<c-d>', -- binding to scroll down inside the popup
            scroll_up = '<c-u>', -- binding to scroll up inside the popup
        },
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        -- triggers = {"<leader>"} -- or specify a list manually
        triggers_blacklist = {
            -- list of mode / prefixes that should never be hooked by WhichKey
            -- this is mostly relevant for key maps that start with a native binding
            -- most people should not need to change this
            i = { "j", "k" },
            v = { "j", "k" },
        },
    })

local wk = require("which-key")
local default_options = { silent = true }

-- register non leader based mappings
wk.register({
    ga = { "<Plug>(EasyAlign)",                    "Align", mode = "x" },
    sa = "Add surrounding",
	sd = "Delete surrounding",
	sh = "Highlight surrounding",
	sr = "Replace surrounding",
	sF = "Find left surrounding",
	sf = "Replace right surrounding",
    ss = { "<Plug>Lightspeed_s",                   "Search 2-character forward" },
    sS = { "<Plug>Lightspeed_S",                   "Search 2-character bbackward" },
    st = { "<cmd>lua require('tsht').nodes()<cr>", "TS hint textobjects" },
})

-- register leader based mappings
wk.register({
    ["<Tab>"] = { "<cmd>e#<cr>",                       "switch to prev. buffer"},
    b = {
        name = "Buffers",
        A = {
            "<cmd>BufferLineCloseLeft<cr><cmd><BufferLineCloseRight<cr>",
            "close All but the current buffer"
        },
        d = { "<cmd>Bdelete!<cr>",                     "Delete buffer" },
        f = { "<cmd>BufferLinePick<cr>",               "pick buffer" },
		l = { "<cmd>BufferLineCloseLeft<cr>",          "close all Left" },
		r = { "<cmd>BufferLineCloseRight<cr>",         "close all Right", },
		x = { "<cmd>BufferLineSortByDirectory<cr>",    "sort by directory", },
		L = { "<cmd>BufferLineSortByExtension<cr>",    "sort by extension", },
    },
    f = {
        name = "Files",
        b = { "<cmd>Telescope file_browser<cr>",       "file Browser" },
        f = { require"telescope.builtin".find_files,   "Find file" },
        r = { "<cmd>Telescope oldfile<cr>",            "open Recent file" },

    },
    l = {
        name = "LSP",
        A = { vim.lsp.buf.add_workspace_folder,        "Add workspace folder" },
        D = { vim.lsp.buf.declaration,                 "go to Declaration" },
        K = { vim.lsp.buf.hover,                       "hover commands" },
        L = { vim.lsp.buf.list_workspace_folders,      "List workspace folders" },
        R = { vim.lsp.buf.rename,                      "Rename" },
        W = { vim.lsp.buf.remove_workspace_folder,     "remove Workspace folder", },
        a = { vim.lsp.buf.code_action,                 "code Action" },
        d = { vim.lsp.buf.definition,                  "go to Definition" },
        f = { vim.lsp.buf.format,                      "Format" },
        i = { "<cmd>LspInfo<cr>",                      "lsp Info" },
        k = { vim.lsp.buf.signature_help,              "signature help" },
        l = { vim.diagnostic.open_float,               "Line diagnostics" },
        n = { vim.diagnostic.goto_next,                "Next diagnostic" },
        p = { vim.diagnostic.goto_prev,                "Prev diagnostic" },
        q = { vim.diagnostic.setloclist,               "Quickfix" },
        r = { vim.lsp.buf.references,                  "References" },
        t = { vim.lsp.buf.type_definition,             "Type definition" },
    },
    m = {
        name = "Misc",
        d = { require("functions").toggle_diagnostics, "toggle Diagnostics" },
        p = { "<cmd>PackerSync<cr>",                   "PackerSync" },
        t = { "<cmd>FloatermToggle<cr>",               "Terminal" },
    },
    q = {
        name = "Quickfix",
        j = { "<cmd>cnext<cr>",                        "next quickfix item" },
        k = { "<cmd>cprevious<cr>",                    "previous quickfix item" },
        q = { require("functions").toggle_qf,          "toggle Quickfix list" },
    },
    w = {
        name = "Window",
        p = { "<c-w>x",                                "swaP" },
        q = { "<cmd>q<cr>",                            "Quit" },
        s = { "<cmd>split<cr>",                        "Split" },
        t = { "<c-w>t",                                "move to new Tab" },
        ["="] = { "<c-w>=",                            "Equally size" },
        v = { "<cmd>vsplit<cr>",                       "Vertical split" },
    },
}, { prefix = "<leader>", mode = "n", default_options })
