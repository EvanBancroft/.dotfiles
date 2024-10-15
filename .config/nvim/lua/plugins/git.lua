return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("telescope").load_extension("lazygit")
			-- vim.keymap.set("n", "<leader>lg", "<cmd>Telescope lazygit<cr>")
			vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<cr>")
			vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<cr>")
		end,
	},

	{
		"f-person/git-blame.nvim",
		config = function()
			require("gitblame").setup({
				date_format = "%r",
			})
		end,
	},
}
