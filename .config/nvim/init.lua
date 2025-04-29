require("config.lazy")
require("config.keymap")
require("config.options")

vim.cmd.colorscheme("tokyonight-night")

vim.lsp.enable({
  -- python
  "pyright",
  "ruff",
  -- lua
  "luals",
  -- java
  "jdtls",
  -- golang
  "gopls",
  -- terraform
  "terraformls",
  -- rust
  "rust-analyzer",
  -- c
  "clangd",
  -- typescript/javascript
  "tsls",
})

-- Make clipboard work on WSL (requires xclip installed)
vim.opt.clipboard = "unnamedplus"
