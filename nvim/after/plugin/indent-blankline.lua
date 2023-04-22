-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

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
    -- char = "|",
    show_trailing_blankline_indent = false
})
