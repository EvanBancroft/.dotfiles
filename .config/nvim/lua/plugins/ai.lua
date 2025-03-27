return {
	{
		"supermaven-inc/supermaven-nvim",
		keys = {
			{ "<leader>ai", "<cmd>SupermavenToggle<cr>", desc = "Supermaven Toggle" },
		},
		config = function()
			require("supermaven-nvim").setup({
				ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
				keymaps = {
					accept_suggestion = "<C-l>",
					clear_suggestion = "<C-]>",
					accept_word = nil,
				},
			})
		end,
	},
}
