local capabilities = require('cmp_nvim_lsp').default_capabilities()
local util = require "lspconfig/util"


require("lspconfig").tinymist.setup {
        settings = {
                formatterMode = "typstyle",
                exportPdf = "onType",
                semanticTokens = "disable"
        }
}
--require('lspconfig').zls.setup({})
require('lspconfig').sqls.setup({})

require 'lspconfig'.csharp_ls.setup {}
--require'lspconfig'.vuels.setup{}
require 'lspconfig'.svelte.setup {}

require('lspconfig').rust_analyzer.setup({
	settings = {
		['rust-analyzer'] = {
			diagnostics = {
				enable = true,
				experimental = {
					enable = true,
				},
			},
			checkOnSave = true
		}
	}
})

require('lspconfig').pyright.setup({
	--before_init = function(_, config)
	--  config.settings.python.pythonPath = get_python_path(config.root_dir)
	--end,
	venvPath = ".",
	venv = ".venv"
})
--vim.lsp.config('ty', {
--	cmd = {"uvx", "ty", "server" }
--});
vim.lsp.enable('ty');

require('lspconfig').ts_ls.setup({
})

require 'lspconfig'.gopls.setup {}


-- make sure to disable diagnostics and ignore vendor directory to improve performance
-- `$ phpactor config:set language_server.diagnostics_on_update false`
-- `$ phpactor config:set indexer.exclude_patterns '["/vendor/**/Tests/**/*","/vendor/**/tests/**/*","/var/cache/**/*","/vendor/composer/**/*"]'`
require('lspconfig').phpactor.setup({
	capabilities = capabilities,
})

require('lspconfig').lua_ls.setup({
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim', 'f', 't', 'i', 'fmt', 's' }
			}
		}
	},
})

require('lspconfig').clangd.setup({
	-- remove .proto files
	filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
})

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})
vim.diagnostic.config({ virtual_text = false })
