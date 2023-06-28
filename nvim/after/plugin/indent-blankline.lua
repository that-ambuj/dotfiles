vim.api.nvim_set_hl(0, "IndentBlanklineSpaceChar", { link = "Whitespace", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { link = "Comment", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineContextSpaceChar", { link = "Comment", nocombine = true })
vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { link = "Whitespace", nocombine = true })
-- vim.api.nvim_set_hl(0, "IndentBlanklineSpaceCharBlankline", { link = "LineNr", nocombine = true })
-- vim.api.nvim_set_hl(0, "IndentBlanklineChar", { link = "LineNr", nocombine = true })

require("indent_blankline").setup({
    show_current_context = true,
    show_current_context_start = false,
    space_char_blankline = " ",
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
