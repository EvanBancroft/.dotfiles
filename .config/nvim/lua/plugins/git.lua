return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "tpope/vim-fugitive",

    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
      vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
      -- vim.keymap.set("n", "<leader>lg", "<cmd>Telescope lazygit<cr>")
      vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")
    end,
  },
}
