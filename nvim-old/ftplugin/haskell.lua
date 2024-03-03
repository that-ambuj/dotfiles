local ht = require('haskell-tools')
local def_opts = { noremap = true, silent = true, }
vim.g.haskell_tools = {
    hls = {
        on_attach = function(client, bufnr)
            local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
            -- haskell-language-server relies heavily on codeLenses,
            -- so auto-refresh (see advanced configuration) is enabled by default
            vim.keymap.set('n', '<space>ch', vim.lsp.codelens.run,
                vim.tbl_extend('keep', opts, { desc = "Run Haskell Code Lens" }))
            vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature,
                vim.tbl_extend('keep', opts, { desc = "Hoogle Signature (Haskell)" }))
            vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all,
                vim.tbl_extend('keep', opts, { desc = "Buffer Evaluate All (Haskell)" }))
        end,
    },
}

local function set_desc(obj, desc)
    obj.desc = desc

    return desc
end

-- Suggested keymaps that do not depend on haskell-language-server:
local bufnr = vim.api.nvim_get_current_buf()
-- set buffer = bufnr in ftplugin/haskell.lua
local opts = { noremap = true, silent = true, buffer = bufnr }

-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, vim.tbl_extend('keep'
, opts, { desc = "Toggle GHCi REPL for current package (Haskell)" }))
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
    ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, vim.tbl_extend('keep', def_opts, { desc = "Toggle a GHCi REPL for current buffer" }))
vim.keymap.set('n', '<leader>rq', ht.repl.quit,
    vim.tbl_extend('keep', def_opts, { desc = "Quit GHCi REPL" }))

-- Detect nvim-dap launch configurations
-- (requires nvim-dap and haskell-debug-adapter)
-- ht.dap.discover_configurations(bufnr)
