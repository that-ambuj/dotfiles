local builtin = require('telescope.builtin')

-- Load lazygit extension for telescope
require('telescope').load_extension('lazygit')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})

-- Enable telescore lazygit plugin
vim.keymap.set('n', '<leader>tg', require("telescope").extensions.lazygit.lazygit)

-- vim.keymap.set('n', '<leader>ps', function()
	-- builtin.grep_string({ search = vim.fn.input("Grep :> ") })
-- end)
