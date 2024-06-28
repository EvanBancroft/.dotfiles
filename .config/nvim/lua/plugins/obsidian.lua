return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		"BufReadPre /Users/evanbancroft/Library/Mobile Documents/iCloud~md~obsidian/Documents/v2.0.1/**.md",
		"BufNewFile /Users/evanbancroft/Library/Mobile Documents/iCloud~md~obsidian/Documents/v2.0.1/**.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-treesitter",
		"nvim-telescope/telescope.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "EvanBancroft",
				path = "/Users/evanbancroft/Library/Mobile Documents/iCloud~md~obsidian/Documents/v2.0.1",
			},
		},
		notes_subdir = "0-inbox",

		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "0-inbox",
			-- Optional, if you want to change the date format for the ID of daily notes.
			default_tags = { "daily-notes" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = "daily.md",
		},

		templates = {
			folder = "templates",
		},

		-- see below for full list of options 👇
	},
}
