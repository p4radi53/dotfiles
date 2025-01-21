require("config.lazy")
require("config.keymap")
require("config.options")
-- "test comment"
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
vim.cmd.colorscheme("tokyonight-night")
