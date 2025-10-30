vim.g.mapleader = " "

local keymap = vim.keymap

-- Basic keymaps
keymap.set("n", "<leader>q", ":q<CR>", { desc = "quit" })
keymap.set("n", "<leader>wq", ":wq<CR>", { desc = "write and quit" })
keymap.set("n", "<leader>w", ":write<CR>", { desc = "write" })
keymap.set("n", "U", "<C-r>", { desc = "redo" })
keymap.set("i", "jj", "<ESC>", { desc = "exit insert mode" })

-- Disable pgup/pgdown keys
keymap.set({ "n", "i" }, "<PageDown>", "<Nop>", { silent = true })
keymap.set({ "n", "i" }, "<PageUp>", "<Nop>", { silent = true })

-- Quickfix navigation
keymap.set("n", "]q", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
keymap.set("n", "[q", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix" })

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)

		keymap.set("n", "<leader>cq", "<cmd>lua vim.diagnostic.setqflist()<cr><cmd>:copen<cr>", opts)
		keymap.set("n", "<leader>cd", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
		keymap.set("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		keymap.set({ "n", "x" }, "<leader>cf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})
