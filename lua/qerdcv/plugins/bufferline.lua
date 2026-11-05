return {
	"akinsho/bufferline.nvim",
	version = "*", -- or tag = 'v4.*'
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require('bufferline').setup({
			options = {
				diagnostics = 'nvim_lsp',
				show_buffer_close_icons = true,
				show_close_icon = true,
				always_show_bufferline = true,
			}
		})

		vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { silent = true })
		vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { silent = true })
		
	end,
}
