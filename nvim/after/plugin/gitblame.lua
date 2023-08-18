vim.cmd("GitBlameDisable")

vim.keymap.set("n", "<leader>bg", "<Cmd>GitBlameToggle<CR>", {
    desc = "Toggle Git Line Blame"
})
