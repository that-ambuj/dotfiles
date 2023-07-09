vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open file explorer aka netrw" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<C-j>", "<C-w>j<CR>")
vim.keymap.set("n", "<C-k>", "<C-w>k<CR>")
vim.keymap.set("n", "<C-l>", "<C-w>l<CR>")

vim.keymap.set("n", "<C-b>", "<C-w>s<CR>")
vim.keymap.set("n", "<C-g>", "<C-w>v<CR>")

-- Quick fix maps (don't know what that is)
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Remaps Ctrl+Backspace to emacs Ctrl+W, which deletes a word
vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-H>", "<C-W>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>",
    { desc = "Install and Update packages (:PackerSync)", silent = true })

vim.keymap.set("n", "<leader>bt", function()
    local buftype = vim.bo.buftype
    local filetype = vim.o.filetype

    print(vim.bo.filetype)
end)
