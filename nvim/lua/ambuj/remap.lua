vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open file explorer aka netrw" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape" })

vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true, desc = "quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true, desc = "write" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>pp", '"_dP', { desc = "Overwrite current line without yanking to Clipboard" })

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<C-l>", "<C-w>l<CR>")
vim.keymap.set("n", "<M-j>", "<C-w>j<CR>")
vim.keymap.set("n", "<M-k>", "<C-w>k<CR>")

vim.keymap.set("n", "<C-b>", "<C-w>s<CR>")
vim.keymap.set("n", "<C-g>", "<C-w>v<CR>")

-- Quick fix maps (I now know what that is) [Synced with Telescope]
vim.keymap.set("n", "<M-q>", "<cmd>copen<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- Location List (Synced with Location List)
vim.keymap.set("n", "<M-l>", "<cmd>lopen<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")

-- Remaps Ctrl+Backspace to emacs Ctrl+W, which deletes a word
vim.keymap.set("i", "<C-BS>", "<C-W>")
vim.keymap.set("i", "<C-H>", "<C-W>")

-- vim.keymap.set('n', "<tab>", ":tabnext<CR>")
vim.keymap.set('n', "<C-t>", ":tabnew .<CR>")
vim.keymap.set('n', "<C-w>", ":tabclose<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Rename below cursor globally" })

-- vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>",
--     { desc = "Install and Update packages (:PackerSync)", silent = true })



-- vim.keymap.set({ "n", "v" }, "<leader>pc", [["*p]], { desc = "Paste from Selection Clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>ps", [["+p]], { desc = "Pase from System Clipboard" })

vim.keymap.set("n", "<leader>bt", function()
    local buftype = vim.bo.buftype
    local filetype = vim.o.filetype

    print(vim.bo.filetype)
end)
