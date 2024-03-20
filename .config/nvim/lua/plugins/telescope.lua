vim.api.nvim_create_autocmd("FileType", {
	pattern = "TelescopeResults",
	callback = function(ctx)
		vim.api.nvim_buf_call(ctx.buf, function()
			vim.fn.matchadd("TelescopeParent", "\t\t.*$")
			vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
		end)
	end,
})

local function filenameFirst(_, path)
	local tail = vim.fs.basename(path)
	local parent = vim.fs.dirname(path)
	if parent == "." then
		return tail
	end
	return string.format("%s\t\t%s", tail, parent)
end

return {

	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	-- or                              , branch = '0.1.x',
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	lazy = false,
	opts = {
		pickers = {
			find_files = {
				path_display = filenameFirst,
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "fg", builtin.git_files, {})

		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent files" },
		{ "<leader>fc", "<cmd>Telescope commands<CR>", desc = "Commands" },
		{ "<leader>fC", "<cmd>Telescope colorscheme<CR>", desc = "Colorscheme" },
		{ "<leader>fh", "<cmd>Telescope find_files hidden=true<CR>", desc = "Hidden Files" },
	},
}
