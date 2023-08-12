local trouble = require("trouble")

local opts = {
    icons = false,
    fold_open = "v",      -- icon used for open folds
    fold_closed = ">",    -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    -- signs = {
    -- icons / text used for a diagnostic
    --     error = "error",
    --     warning = "warn",
    --     hint = "hint",
    --     information = "info"
    -- },
    use_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
}

-- trouble.setup(opts)

vim.keymap.set("n", "<leader>xx", function() trouble.open() end)
vim.keymap.set("n", "<leader>xw", function() trouble.open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() trouble.open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() trouble.open("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() trouble.open("loclist") end)
vim.keymap.set("n", "gR", function() trouble.open("lsp_references") end)
