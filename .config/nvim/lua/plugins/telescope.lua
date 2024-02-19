return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  -- or                              , branch = '0.1.x',
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Telescope",
  lazy = false,
  config = function(_, opts)
    require("telescope").setup(opts)

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.git_files, {})

    vim.keymap.set("n", "<leader>ps", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end,
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<CR>",             desc = "Files" },
    { "<leader>fr", "<cmd>Telescope oldfiles<CR>",               desc = "Recent files" },
    { "<leader>fc", "<cmd>Telescope commands<CR>",               desc = "Commands" },
    { "<leader>fC", "<cmd>Telescope colorscheme<CR>",            desc = "Colorscheme" },
    { "<leader>fh", "<cmd>Telescope find_files hidden=true<CR>", desc = "Hidden Files" },
  },
}
