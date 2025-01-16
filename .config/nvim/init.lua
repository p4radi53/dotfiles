require("config.lazy")
require("config.keymap")
require("config.options")

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
