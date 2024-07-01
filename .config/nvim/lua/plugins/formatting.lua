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
				elixir = {
					"mix",
				},
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
				javascript = { { "prettierd", "prettier" }, "rustywind" },
				typescript = { { "prettierd", "prettier" }, "rustywind" },
				javascriptreact = { { "prettierd", "prettier" }, "rustywind" },
				typescriptreact = { { "prettierd", "prettier" }, "rustywind" },
				elixir = { "mix" },
				bash = { "shfmt" },
				sh = { "shfmt" },
				fish = { "fish_indent" },
				go = { "goimports", "gofumpt", "goimports-reviser" },
				vue = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				scss = { { "prettierd", "prettier" } },
				less = { { "prettierd", "prettier" } },
				html = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				jsonc = { { "prettierd", "prettier" } },
				yaml = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				["markdown.mdx"] = { { "prettierd", "prettier" } },
				graphql = { { "prettierd", "prettier" } },
				handlebars = { { "prettierd", "prettier" } },
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
