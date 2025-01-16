vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>w", ":write<CR>", { desc = "Write" })
keymap.set("n", "U", "<C-r>", { desc = "redo" })
keymap.set("i", "jj", "<ESC>", { desc = "exit insert mode" })
