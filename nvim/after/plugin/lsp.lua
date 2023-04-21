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

lsp.setup_nvim_cmp({
    sources = {
        { name = "nvim_lsp" },
        { name = 'path' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 }
    }
})

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
            select = false,
        }),
    }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_extend(args.body)
        end
    },
    sources = {
        { name = "nvim_lsp" },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' }
    }
})

lsp.set_preferences({
    sign_icons = {},
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    vim.api.nvim_create_autocmd("BufWrite", {
        callback = function() vim.lsp.buf.format({ async = false, timeout = 10000 }) end,
    })

    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)

    vim.keymap.set(
        "n",
        "<leader>fm",
        function() vim.lsp.buf.format({ async = false, timeout_ms = 10000, bufnr = bufnr }) end,
        { desc = "Format all code in this file" }
    )
end)


-- lsp.setup_nvim_cmp({ mappings = cmp_mappings })
--

--- Rust tools stuff
lsp.skip_server_setup({ 'rust_analyzer', 'clangd' })

lsp.setup()

--- Rust tools stuff
local rust_tools = require("rust-tools")

--- Flutter tools stuff
local dart_lsp = lsp.build_options("dartls", {})

local flutter_tools = require('flutter-tools')

require("flutter-tools").setup({
    lsp = {
        capabilities = dart_lsp.capabilities,
        on_attach = function()
            vim.api.nvim_create_autocmd("BufWritePost", {
                command = ":FlutterReload"
            })
        end
    },
})

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

-- CXX / ClangD-extensions.nvim setup
require("clangd_extensions").setup()
