local builtin = require("telescope.builtin")

-- Load lazygit extension for telescope
require("telescope").load_extension("lazygit")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search for file by name in project root" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search for file name only in git files" })
vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "Search for text in all files" })

-- Enable telescore lazygit plugin
vim.keymap.set(
    "n",
    "<leader>tg",
    require("telescope").extensions.lazygit.lazygit,
    { desc = "Open list of lazygit projects in telescope" }
)

vim.keymap.set(
    "n",
    "<leader>gs",
    function() builtin.grep_string({ search = vim.fn.input("Grep :> ") }) end,
    { desc = "Search for string in current file" }
)
