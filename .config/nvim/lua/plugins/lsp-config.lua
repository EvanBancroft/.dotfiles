return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		opts = {
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			settings = {
				-- jsx_close_tag = {
				-- 	enable = true,
				-- 	filetypes = { "javascriptreact", "typescriptreact" },
				-- },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath for Neovim
			{ "williamboman/mason.nvim", config = true },
			"saghen/blink.cmp",

			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			-- Useful status updates for LSP.
			{
				"j-hui/fidget.nvim",
				opts = {
					notification = {
						window = {
							winblend = 0,
						},
					},
				},
			},

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			lspconfig.handlers = {
				["tsserver"] = function() end, -- handled by typescript_tools.lua
			}

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("<leader>gd", function()
						vim.lsp.buf.definition()
					end, "[G]oto Definition")

					map("<leader>vws", function()
						vim.lsp.buf.workspace_symbol()
					end, "[V]iew [W]orkspace [S]ymbol")
					map("<leader>vd", function()
						vim.diagnostic.open_float()
					end, "[V]iew [D]iagnostic")
					map("<leader>ca", function()
						require("fzf-lua").lsp_code_actions({
							winopts = {
								relative = "cursor",
								width = 0.6,
								height = 0.6,
								row = 1,
								preview = { vertical = "up:70%" },
							},
						})
					end, "[C]ode [A]ction")
					-- map("[d", function()
					-- 	vim.diagnostic.goto_next()
					-- end, "Goto Next")
					-- map("]d", function()
					-- 	vim.diagnostic.goto_prev()
					-- end, "Goto Prev")

					vim.keymap.set("n", "<leader>vrr", function()
						vim.lsp.buf.references()
					end)
					vim.keymap.set("n", "<leader>vrn", function()
						vim.lsp.buf.rename()
					end)
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				ts_ls = {},
				gopls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			for server, config in pairs(servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
				"prettier",
				"prettierd",
				"rustywind",
				"shfmt",
				"bash-language-server",
				"astro-language-server",
				"eslint_d",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			---@diagnostic disable-next-line: missing-fields
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for ts_ls)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
