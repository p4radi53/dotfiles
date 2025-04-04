return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "tflint",
        "lua_ls",
        "terraformls",
        "pyright",
        "ts_ls",
        "rust_analyzer",
        "ruff",
        "jdtls",
        "gopls",
      },
    },
  },
}
