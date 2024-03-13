-- return {
--
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--     local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.prettier,
--         --        null_ls.builtins.diagnostics.eslint_d,
--       },
--
--       -- you can reuse a shared lspconfig on_attach callback here
--       on_attach = function(client, bufnr)
--         if client.supports_method("textDocument/formatting") then
--           vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             group = augroup,
--             buffer = bufnr,
--             callback = function()
--               -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--               -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
--               vim.lsp.buf.format({ async = false })
--             end,
--           })
--         end
--       end,
--     })
--
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end,
-- }
--
return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			-- Your config will go here
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = {
					"eslint_d",
				},
				typescript = {
					"eslint_d",
				},
				javascriptreact = {
					"eslint_d",
				},
				typescriptreact = {
					"eslint_d",
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
		-- keys = {
		--   {
		--     -- Customize or remove this keymap to your liking
		--     "<leader>f",
		--     function()
		--       require("conform").format({ async = true, lsp_fallback = true })
		--     end,
		--     mode = "",
		--     desc = "Format buffer",
		--   },
		-- },
		-- Everything in opts will be passed to setup()
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				elixir = { "mix" },
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
