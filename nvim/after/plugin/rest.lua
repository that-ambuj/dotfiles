require("rest-nvim").setup({})

vim.keymap.set("n", "<leader>rn", "<Plug>RestNvim", { desc = "Run Request under the cursor" });
vim.keymap.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview the request cURL Command" })
vim.keymap.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "re-run the last request" })
