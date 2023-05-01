vim.cmd [[highlight IndentBlanklineIndent1 guifg=#444444 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#1a1a1a gui=nocombine]]

require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = false,
    filetype_exclude = {
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "startify"
    },
    char_highlight_list = {
        "IndentBlanklineIndent1",
        -- "IndentBlanklineIndent2",
    },
    -- char = "|",
    show_trailing_blankline_indent = false
})
