-- vim.cmd("GitBlameDisable")
require("gitblame").setup {
    enabled = true,
    ignored_filetypes = { "netrw" },
}

vim.keymap.set("n", "<leader>bg", "<Cmd>GitBlameToggle<CR>", {
    desc = "Toggle Git Line Blame"
})
