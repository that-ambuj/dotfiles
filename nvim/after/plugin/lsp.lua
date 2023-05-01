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
        callback = function()
            pcall(vim.lsp.buf.format, {
                async = false,
                timeout = 10000,
                filter = function(cl) return cl.name ~= "tsserver" end
            })

            -- vim.lsp.buf.format({
            --     async = false,
            --     timeout = 10000,
            --     filter = function(cl) return cl.name ~= "tsserver" end
            -- })
        end,
    })

    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)

    vim.keymap.set(
        "n",
        "<leader>fm",
        function() vim.lsp.buf.format({ async = false, timeout_ms = 10000, bufnr = bufnr }) end,
        { desc = "Format all code in this file" }
    )

    -- HACK: Omnisharp lsp warnings hacky workarounds
    if client.name == "omnisharp" then
        client.server_capabilities.semanticTokensProvider = {
            full = vim.empty_dict(),
            legend = {
                tokenModifiers = { "static_symbol" },
                tokenTypes = {
                    "comment",
                    "excluded_code",
                    "identifier",
                    "keyword",
                    "keyword_control",
                    "number",
                    "operator",
                    "operator_overloaded",
                    "preprocessor_keyword",
                    "string",
                    "whitespace",
                    "text",
                    "static_symbol",
                    "preprocessor_text",
                    "punctuation",
                    "string_verbatim",
                    "string_escape_character",
                    "class_name",
                    "delegate_name",
                    "enum_name",
                    "interface_name",
                    "module_name",
                    "struct_name",
                    "type_parameter_name",
                    "field_name",
                    "enum_member_name",
                    "constant_name",
                    "local_name",
                    "parameter_name",
                    "method_name",
                    "extension_method_name",
                    "property_name",
                    "event_name",
                    "namespace_name",
                    "label_name",
                    "xml_doc_comment_attribute_name",
                    "xml_doc_comment_attribute_quotes",
                    "xml_doc_comment_attribute_value",
                    "xml_doc_comment_cdata_section",
                    "xml_doc_comment_comment",
                    "xml_doc_comment_delimiter",
                    "xml_doc_comment_entity_reference",
                    "xml_doc_comment_name",
                    "xml_doc_comment_processing_instruction",
                    "xml_doc_comment_text",
                    "xml_literal_attribute_name",
                    "xml_literal_attribute_quotes",
                    "xml_literal_attribute_value",
                    "xml_literal_cdata_section",
                    "xml_literal_comment",
                    "xml_literal_delimiter",
                    "xml_literal_embedded_expression",
                    "xml_literal_entity_reference",
                    "xml_literal_name",
                    "xml_literal_processing_instruction",
                    "xml_literal_text",
                    "regex_comment",
                    "regex_character_class",
                    "regex_anchor",
                    "regex_quantifier",
                    "regex_grouping",
                    "regex_alternation",
                    "regex_text",
                    "regex_self_escaped_character",
                    "regex_other_escape",
                },
            },
            range = true,
        }
    end
end)


-- lsp.setup_nvim_cmp({ mappings = cmp_mappings })
--

--- Rust tools stuff
lsp.skip_server_setup({ 'rust_analyzer', 'clangd', 'tsserver' })

lsp.setup()

--- Rust tools stuff
local rust_tools = require("rust-tools")

--- Flutter tools stuff
local dart_lsp = lsp.build_options("dartls", {})

local flutter_tools = require('flutter-tools')

-- Flutter tools setup
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

-- Typescript nvim setup
require("typescript").setup({
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>mi", "<cmd>TypescriptAddMissingImports<CR>", { buffer = bufnr })
        end
    }
})
