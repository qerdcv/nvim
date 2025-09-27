return {
	'catppuccin/nvim',
	name = 'catppuccin',
	priority = 1000,
	config = function()
		require('catppuccin').setup({
			transparent_background = true,
			term_colors = false,
			integrations = {
				cmd = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				treesitter = true,
				notify = true,
				mini = { enabled = true },
			}
		})
		vim.cmd.colorscheme('catppuccin')
	end,
}
