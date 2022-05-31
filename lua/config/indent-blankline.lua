require("indent_blankline").setup {
    indentLine_enabled = 1,
    filetype_exclude = {
        "startify", "dashboard", "dotooagenda", "log", "fugitive", "gitcommit",
        "packer", "vimwiki", "markdown", "json", "txt", "vista", "help",
        "todoist", "NvimTree", "peekaboo", "git", "TelescopePrompt", "undotree",
        "flutterToolsOutline", "" -- for all buffers without a file type
    },
    buftype_exclude = {"terminal", "nofile"},
    show_first_indent_level = true,
    show_current_context = true,
    show_end_of_line = true,
    space_char_blankline = " ",
    char = "▏",
    char_list = {"|", "¦", "┆", "┊"},
    context_patterns = {
        "class", "function", "method", "block", "list_literal", "selector",
        "^if", "^table", "if_statement", "while", "for"
    }
}
