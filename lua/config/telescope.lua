local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        file_ignore_patterns = { ".vscode", "%.so", "%.o" },
        mappings = {
            i = {
                -- Close on first esc instead of gonig to normal mode
				-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
				["<esc>"]   = actions.close,
				["<C-j>"]   = actions.move_selection_next,
				["<C-u>"]   = actions.results_scrolling_up,
				["<C-d>"]   = actions.results_scrolling_down,
				["<C-k>"]   = actions.move_selection_previous,
				["<C-q>"]   = actions.send_selected_to_qflist,
				["<C-l>"]   = actions.send_to_qflist,
				["<Tab>"]   = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<cr>"]    = actions.select_default,
				["<C-v>"]   = actions.select_vertical,
				["<C-s>"]   = actions.select_horizontal,
				["<C-t>"]   = actions.select_tab,
--				["<C-p>"]   = action_layout.toggle_preview,
--				["<C-o>"]   = action_layout.toggle_mirror,
				["<C-h>"]   = actions.which_key,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            ovverride_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
    buffers = {
        ignore_current_buffer = true,
        sort_last_used = true,
    },
})

telescope.load_extension("fzf")
telescope.load_extension("file_browser")

