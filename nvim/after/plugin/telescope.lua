local builtin = require("telescope.builtin")

-- Load lazygit extension for telescope
require("telescope").load_extension("lazygit")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search for file by name in project root" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search for file name only in git files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search for text in all files" })

-- Enable telescore lazygit plugin
vim.keymap.set(
    "n",
    "<leader>tg",
    require("telescope").extensions.lazygit.lazygit,
    { desc = "Open list of lazygit projects in telescope" }
)

vim.keymap.set(
    "n",
    "<leader>fs",
    function() builtin.grep_string({ search = vim.fn.input("Grep :> ") }) end,
    { desc = "Search for string in current file" }
)

vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Show all buffers in telescope" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Show neovim help tags" })

vim.keymap.set("n", "<leader>ft", builtin.colorscheme)
