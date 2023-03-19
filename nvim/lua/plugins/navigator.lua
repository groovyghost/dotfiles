return {
	"numToStr/Navigator.nvim",
	config = function()
		require("Navigator").setup({})
		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		-- tmux navigation
		map("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>", opts)
		map("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>", opts)
		map("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>", opts)
		map("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>", opts)
	end,
}
