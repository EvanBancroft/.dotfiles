return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
              or vim.bo.commentstring
        end,
      },
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    config = function()
      local splits = require("smart-splits")
      -- recommended mappings
      -- resizing splits
      -- these keymaps will also accept a range,
      -- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
      vim.keymap.set("n", "<A-h>", splits.resize_left)
      vim.keymap.set("n", "<A-j>", splits.resize_down)
      vim.keymap.set("n", "<A-k>", splits.resize_up)
      vim.keymap.set("n", "<A-l>", splits.resize_right)
      -- moving between splits
      vim.keymap.set("n", "<C-h>", splits.move_cursor_left)
      vim.keymap.set("n", "<C-j>", splits.move_cursor_down)
      vim.keymap.set("n", "<C-k>", splits.move_cursor_up)
      vim.keymap.set("n", "<C-l>", splits.move_cursor_right)
      -- swapping buffers between windows
      vim.keymap.set("n", "<leader><leader>h", splits.swap_buf_left)
      vim.keymap.set("n", "<leader><leader>j", splits.swap_buf_down)
      vim.keymap.set("n", "<leader><leader>k", splits.swap_buf_up)
      vim.keymap.set("n", "<leader><leader>l", splits.swap_buf_right)
    end,
  },
}
