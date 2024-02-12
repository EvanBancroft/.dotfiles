vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>bv", "<cmd>:vsplit<cr>")
vim.keymap.set("n", "<leader>bh", "<cmd>:split<cr>")
vim.keymap.set("n", "ss", ":write<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
