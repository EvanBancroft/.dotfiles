return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	priority = 999,
	config = function()
		local git_blame = require("gitblame")
		-- This disables showing of the blame text next to the cursor
		vim.g.gitblame_display_virtual_text = 0

		require("lualine").setup({
			options = {
				--    theme = theme,
				disabled_filetypes = { "neo-tree", "oil", "alpha" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
				},

				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			winbar = {
				lualine_a = {},
				lualine_b = {
					{ "filetype", icon_only = true, icon = { align = "left" } },
					{ "filename", file_status = false, path = 1 },
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {
					{ "filetype", icon_only = true, icon = { align = "left" } },
					{ "filename", file_status = false, path = 1 },
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
