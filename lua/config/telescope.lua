local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope._extensions.file_browser.actions")
local action_layout = require("telescope.actions.layout")

telescope.setup({
    defaults = {
        file_ignore_patterns = { ".vscode" },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        file_browser = {
            theme = "ivy",
            mappings = {
                ["i"] = {
                    ["<S-M>"] = fb_actions.move,
                },
                ["n"] = {

                },
            },
        },
    },
    pickers = {
        file_files = {
            hidden = true,
        },
        buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
        },
    },
})


telescope.load_extension("fzf")
telescope.load_extension("zoxide")
telescope.load_extension("file_browser")
