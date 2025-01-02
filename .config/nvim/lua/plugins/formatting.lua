return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			-- Your config will go here
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = {
					"eslint_d",
					"rustywind",
				},
				typescript = {
					"eslint_d",
					"rustywind",
				},
				javascriptreact = {
					"eslint_d",
					"rustywind",
				},
				typescriptreact = {
					"eslint_d",
					"rustywind",
				},
				astro = {
					"eslint_d",
					"rustywind",
				},
				elixir = {
					"mix",
				},
				go = { "golangcilint" },
			}
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { "prettier", "rustywind" },
				typescript = { "prettier", "rustywind" },
				javascriptreact = { "prettier", "rustywind" },
				typescriptreact = { "prettier", "rustywind" },
				astro = { "prettierd", "prettier", "rustywind" },
				elixir = { "mix" },
				eelixir = { "mix" },
				heex = { "mix" },
				surface = { "mix" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				fish = { "fish_indent" },
				go = { "goimports", "gofumpt", "goimports-reviser" },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				less = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				jsonc = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				["markdown.mdx"] = { "prettierd", "prettier", stop_after_first = true },
				graphql = { "prettierd", "prettier", stop_after_first = true },
				handlebars = { "prettierd", "prettier", stop_after_first = true },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, lsp_fallback = true },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
