local colors = {
  black = "#16161D",
  white = "#DCD7BA",
  red = "#C34043",
  green = "#76946A",
  blue = "#7E9CD8",
  yellow = "#E6C384",
  gray_500 = "#454559", -- 500
  gray_400 = "#9D9DB3", -- 400
  gray_300 = "#6B6B8A", -- 300
  gray_200 = "#9D9DB3", -- 200
}

local theme = {
  normal = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray_400, fg = colors.gray_500 },
    c = { bg = colors.gray_500, fg = colors.gray_400 },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray_400, fg = colors.gray_300 },
    c = { bg = colors.gray_500, fg = colors.gray_400 },
  },
  visual = {
    a = { bg = colors.red, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray_400, fg = colors.gray_300 },
    c = { bg = colors.gray_500, fg = colors.gray_400 },
  },
  replace = {
    a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray_400, fg = colors.gray_300 },
    c = { bg = colors.gray_500, fg = colors.gray_400 },
  },
  command = {
    a = { bg = colors.white, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray_400, fg = colors.gray_300 },
    c = { bg = colors.gray_500, fg = colors.gray_400 },
  },
  inactive = {
    a = { bg = colors.gray_500, fg = colors.black, gui = "bold" },
    b = { bg = colors.gray_400, fg = colors.gray_300 },
    c = { bg = colors.gray_500, fg = colors.gray_400 },
  },
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        --    theme = theme,
        disabled_filetypes = { "neo-tree" },
      },
    })
  end,
}
