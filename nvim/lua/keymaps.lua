-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Write and quit remaps
vim.keymap.set('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Open file explorer aka netrw' })
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Escape' })

vim.keymap.set('n', '<leader>q', ':q<CR>', { silent = true, desc = '[Q]uit File' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true, desc = '[W]rite File' })

vim.keymap.set('n', 'Q', '<nop>')

-- Quick fix maps (I now know what that is)
vim.keymap.set('n', '<C-q>', '<cmd>copen<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>zz')

-- Location List (Synced with Location List)
vim.keymap.set('n', '<C-l>', '<cmd>lopen<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>zz')

-- Remaps Ctrl+Backspace to emacs Ctrl+W, which deletes a word
vim.keymap.set('i', '<C-BS>', '<C-W>')
vim.keymap.set('i', '<M-BS>', '<C-W>')
vim.keymap.set('i', '<C-H>', '<C-W>')

-- Clipboard keymaps
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]], { desc = 'Paste from System Clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = 'Copy to System Clipboard' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Ctrl + Backspace remap
vim.keymap.set('i', '<C-BS>', '<C-W>')
vim.keymap.set('i', '<M-BS>', '<C-W>')
vim.keymap.set('i', '<C-H>', '<C-W>')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Rename All Instances below in the file' })
vim.keymap.set('v', '<leader>s', [[y<Esc>:%s/\V<C-r>"//gI<Left><Left><Left>]], { desc = 'Rename Selected Text in the whole file' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
