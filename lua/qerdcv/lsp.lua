vim.lsp.config['lua_ls'] = {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { { '.luarc.json', '.luarc.jsonc' } },

	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			}
		}
	}
}

-- Rust: rust-analyzer
vim.lsp.config('rust_analyzer', {
	cmd = { 'rust-analyzer' },
	filetypes = { 'rust' },
	root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
	settings = {
		['rust-analyze'] = {
			check = { command = 'check' },
		}
	},
})

-- Go: gopls
vim.lsp.config('gopls', {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	root_markers = { 'go.work', 'go.mod' },
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			analyses = { unusedparams = true },
		},
	},
})

vim.lsp.config('clangd', {
	cmd = {
		'clangd',
		'--background-index',
		'--clang-tidy',
		'--completion-style=detailed',
		'--header-insertion=iwyu',
		'--header-insertion-decorators',
		'--function-arg-placeholders',
		'--fallback-style=LLVM'
	},
	filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
	root_markers = { 'CMakeLists.txt' },
	settings = {}
})

vim.lsp.enable({
	'lua_ls',
	'gopls',
	'rust_analyzer',
	'clangd',
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local opts = {buffer = ev.buf}
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
		vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
	end,
})
