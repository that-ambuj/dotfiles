vim.api.nvim_set_hl(0, "IndentBlanklineSpaceChar", { link = "Comment", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineSpaceCharBlankline", { link = "Comment", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { link = "Comment", nocombine = true })


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
    show_trailing_blankline_indent = false
})
