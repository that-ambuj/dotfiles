local lsp = require("lsp-zero")

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
        },
    },
})

lsp.preset("recommended")

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "rust_analyzer",
})

local cmp = require("cmp")

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
        ["<Tab>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    }),
})

lsp.set_preferences({
    sign_icons = {},
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    vim.keymap.set(
        "n",
        "<leader>fm",
        function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
        { desc = "Format all code in this file" }
    )
end)

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end,
})

-- lsp.setup_nvim_cmp({ mappings = cmp_mappings })
--

--- Rust tools stuff
lsp.skip_server_setup({ 'rust_analyzer' })

lsp.setup()

local rust_tools = require("rust-tools")

-- Rust tools stuff
rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions,
                { buffer = bufnr, desc = "Rust tools: Hover actions" })
            vim.keymap.set("n", "<leader>rc", rust_tools.open_cargo_toml.open_cargo_toml,
                { buffer = bufnr, desc = "Rust tools: Open Cargo.toml" })

            rust_tools.inlay_hints.enable()
        end
    }
})
