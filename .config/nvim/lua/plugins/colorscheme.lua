return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			style = "storm",
			dim_inactive = true, -- dims inactive windows
			lualine_bold = true,
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		config = {
			styles = {
				transparency = true,
			},
		},
	},
}
