return {
	'hrsh7th/nvim-cmp',


	dependencies = {
		'hrsh7th/cmp-nvim-lsp',

		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
	},

	config = function()
		local cmp = require('cmp')

		cmp.setup({
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'path' },
				{ name = 'buffer' },
			}),
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end
			},
			mapping = cmp.mapping.preset.insert({}),
		})
	end
}
