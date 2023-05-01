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

local function skip_filetype(key, filetype)
    if vim.bo.filetype == filetype then
        return key
    end
end

vim.keymap.set("t", "<Esc>",
    function()
        if vim.bo.filetype == "lazygit" then
            return "<Esc>"
        end

        return [[<C-\><C-n>]]
    end, {
        expr = true
    })


-- vim.keymap.set("t", "jk",
--     function()
--         if vim.bo.filetype == "lazygit" then
--             return "jk"
--         end
--
--         return [[<C-\><C-n>]]
--     end, {
--         expr = true,
--     })

vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)

vim.keymap.set("n", "<leader>tt", ":ToggleTerm<CR>")
vim.keymap.set("n", "<leader>tf", ":ToggleTerm direction=float<CR>")
