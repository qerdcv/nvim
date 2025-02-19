return {
	'nvim-neotest/neotest',
	dependencies = {
		'nvim-neotest/nvim-nio',
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		{ 'fredrikaverpil/neotest-golang', version = '*' }
	},
	config = function()
		local neotest = require('neotest');
		neotest.setup({
			adapters = {
				require('neotest-golang')({})
			},
		})

		-- Keymaps for convenience
		vim.keymap.set("n", "<leader>Tr", function() neotest.run.run() end, { desc = "Run nearest test" })
		vim.keymap.set("n", "<leader>Tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run tests in file" })
		vim.keymap.set("n", "<leader>Ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })
		vim.keymap.set("n", "<leader>To", function() neotest.output.open({ enter = true }) end, { desc = "Open test output" })
		vim.keymap.set("n", "<leader>TO", function() neotest.output_panel.toggle() end, { desc = "Toggle output panel" })
		vim.keymap.set("n", "<leader>Tw", function() neotest.watch.toggle(vim.fn.expand("%")) end, { desc = "Watch file for test changes" })
		vim.keymap.set("n", "<leader>Tt", function() neotest.run.run_last() end, { desc = "Run last test" })
	end,
}
