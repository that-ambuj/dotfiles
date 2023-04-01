local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add current file to harpoon" })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })

vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end, { desc = "Switch to harpoon mark 1" })
vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end, { desc = "Switch to harpoon mark 2" })
vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end, { desc = "Switch to harpoon mark 3" })
vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end, { desc = "Switch to harpoon mark 4" })
vim.keymap.set("n", "<C-5>", function() ui.nav_file(5) end, { desc = "Switch to harpoon mark 5" })
vim.keymap.set("n", "<C-6>", function() ui.nav_file(6) end, { desc = "Switch to harpoon mark 6" })
vim.keymap.set("n", "<C-7>", function() ui.nav_file(7) end, { desc = "Switch to harpoon mark 7" })
vim.keymap.set("n", "<C-8>", function() ui.nav_file(8) end, { desc = "Switch to harpoon mark 8" })
