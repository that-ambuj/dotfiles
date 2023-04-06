require("toggleterm").setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    direction = 'vertical'
})

local opts = { buffer = 0 }

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("t", "jk", [[<C-\><C-n>]])
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
