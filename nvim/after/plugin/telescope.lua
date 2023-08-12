local builtin = require("telescope.builtin")
local trouble = require("trouble.providers.telescope")

local actions = require("telescope.actions")

local telescope = require("telescope")

-- Load lazygit extension for telescope
telescope.load_extension("lazygit")

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<c-t>"] = actions.smart_send_to_qflist,
                ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
            },
            n = { ["<c-t>"] = actions.smart_send_to_qflist },
        },
    },
}

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

-- Keymaps for LSP Symbols
vim.keymap.set("n", "<leader>ld", builtin.lsp_document_symbols, { desc = "Search for LSP Symbols in this file." })
vim.keymap.set("n", "<leader>lw", builtin.lsp_dynamic_workspace_symbols,
    { desc = "Search for LSP Symbols in this Workspace." })

vim.keymap.set("n", "<leader>li", builtin.lsp_incoming_calls, { desc = "Search/Show all Incoming calls to function" })
vim.keymap.set("n", "<leader>lo", builtin.lsp_outgoing_calls, { desc = "Search/Show all Outgoing calls from function" })
vim.keymap.set("n", "<leader>lm", builtin.lsp_implementations, { desc = "Search/Show Implementations" })
vim.keymap.set("n", "gR", builtin.lsp_references, { desc = "Go To References" })
