return {
	{
		"preservim/vim-pencil",
		lazy = true,
	},
	{
		"folke/zen-mode.nvim",
		lazy = true,
		opts = {
			wezterm = {
				enabled = true,
				-- can be either an absolute font size or the number of incremental steps
				font = "+4", -- (10% increase per step)
			},
		},
	},
}
