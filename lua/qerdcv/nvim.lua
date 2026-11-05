vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard:append('unnamedplus')
vim.opt.list = true
vim.opt.listchars = 'space:·,tab:→ '
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = '✘',
			[vim.diagnostic.severity.WARN] = '▲',
			[vim.diagnostic.severity.HINT] = '⚑',
			[vim.diagnostic.severity.INFO] = '»',
		},
	},
})

-- format on hontkey and display inlay hints, but only if LSP is attached

-- go auto formatting
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function(ev)
    local client = vim.lsp.get_clients({ bufnr = ev.buf, name = 'gopls' })[1]
    if not client then return end
    local enc = client.offset_encoding
    local params = vim.lsp.util.make_range_params(0, enc)
    params.context = { only = { 'source.organizeImports' } }
    local res = client:request_sync('textDocument/codeAction', params, 3000, ev.buf)
    for _, r in pairs(res and res.result or {}) do
      if r.edit then
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
    vim.lsp.buf.format({ bufnr = ev.buf, async = false })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'c' },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
		vim.opt_local.softtabstop = 2
	end
})

