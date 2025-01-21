vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>q", ":q<CR>", {desc = "quit"})
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "write and quit"})
keymap.set("n", "<leader>w", ":write<CR>", { desc = "write" })
keymap.set("n", "U", "<C-r>", { desc = "redo" })
keymap.set("i", "jj", "<ESC>", { desc = "exit insert mode" })
