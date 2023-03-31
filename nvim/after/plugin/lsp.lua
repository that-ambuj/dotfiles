local lsp = require('lsp-zero')

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace"
			}
		}
	}
})

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'rust_analyzer'
})

local cmp = require('cmp')

cmp.setup {
	mapping = cmp.mapping.preset.insert {
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
		['<Tab>'] = cmp.mapping.confirm {
			bhavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
	}
}

lsp.set_preferences({
	sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })

	vim.keymap.set('n', '<leader>fm', function()
		vim.lsp.buf.format({ async = true, timeout_ms = 10000 })
	end)
end)

-- lsp.setup_nvim_cmp({ mappings = cmp_mappings })

lsp.setup()
