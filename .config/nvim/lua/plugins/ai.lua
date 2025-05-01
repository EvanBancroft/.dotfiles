return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				openai = function()
					return require("codecompanion.adapters").extend("openai", {
						schema = {
							model = {
								default = "claude-3-7-sonnet-20250219",
							},
						},
					})
				end,
			},
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
			},
			display = {
				chat = {
					window = {
						position = "right",
					},
				},
			},
		},
		keys = {
			{
				"<leader>cm",
				"<cmd>CodeCompanionActions<cr>",
				desc = "Open [C]ode Companion [M]enu",
				mode = { "v", "n" },
			},
			{
				"<leader>cc",
				"<cmd>CodeCompanionChat Toggle<cr>",
				desc = "Open [C]ode Companion [C]hat",
				mode = { "v", "n" },
			},
		},
	},
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
