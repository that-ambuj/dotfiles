local lsp = require("lsp-zero").preset("recommended")

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

local lsp_util = require("lspconfig.util")

lspconfig.angularls.setup({
    root_dir = lsp_util.root_pattern("project.json", "angular.json")
})

-- lsp.preset("recommended")

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
local cmp_action = require("lsp-zero").cmp_action();
local luasnip = require("luasnip")

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
    enabled = true,
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete({}),
        ["<CR>"] = cmp.mapping.confirm({ select = true, }),
        ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                -- cmp_action.tab_complete();
                cmp.mapping.confirm({ select = true })();
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_extend(args.body)
        end
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lsp_signature_help" },
        { name = "lua" },
        { name = 'luasnip' },
        { name = 'path' },
        -- { name = 'buffer' }
    }
})

-- If you want insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- cmp.event:on(
--     'confirm_done',
--     cmp_autopairs.on_confirm_done()
-- )

lsp.set_preferences({
    sign_icons = {},
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })

    -- local allow_format = { 'lua_ls', 'rust_analyzer', 'tsserver', 'prettierd', 'prettier', 'pint' }

    -- if vim.tbl_contains(allow_format, client.name) then
    --     require("lsp-format").on_attach(client)
    -- end

    if client.supports_method('textDocument/formatting') then
        require("lsp-format").on_attach(client)
    end

    -- vim.api.nvim_create_autocmd("BufWrite", {
    --     callback = function()
    --         vim.lsp.buf.format({
    --             async = false,
    --             timeout = 500,
    --         })
    --     end,
    -- })

    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)

    vim.keymap.set(
        "n",
        "<leader>fm",
        function() vim.lsp.buf.format({ async = true, timeout_ms = 10000, bufnr = bufnr }) end,
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


--- Rust tools stuff
lsp.skip_server_setup({ 'rust_analyzer', 'clangd' })

lsp.setup()

require("mason").setup()

require('mason-null-ls').setup({
    ensure_installed = nil,
    automatic_installation = false,
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.blade_formatter,
        null_ls.builtins.formatting.pint
    }
})

--- Rust tools stuff
local rust_tools = require("rust-tools")

--- Flutter tools stuff
local dart_lsp = lsp.build_options("dartls", {})

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

local inlay_hints_options = {
    -- Only show inlay hints for the current line
    only_current_line = false,

    -- prefix for parameter hints
    -- default: "<-"
    parameter_hints_prefix = "<- ",

    -- prefix for all the other hints (type, chaining)
    -- default: "=>"
    other_hints_prefix = "=> ",

    -- whether to align to the length of the longest line in the file
    max_len_align = true,

    -- padding from the left if max_len_align is true
    max_len_align_padding = 1,

    -- whether to align to the extreme right or not
    right_align = false,

    -- The color of the hints
    highlight = "Comment",
}

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
    },
    tools = {
        -- These apply to the default RustSetInlayHints command
        inlay_hints = inlay_hints_options,
    }
})

-- CXX / ClangD-extensions.nvim setup
require("clangd_extensions").setup({
    extensions = {
        inlay_hints = inlay_hints_options
    }
})

-- Typescript nvim setup
require("typescript").setup({
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "<leader>mi", "<cmd>TypescriptAddMissingImports<CR>", { buffer = bufnr })
        end
    }
})
