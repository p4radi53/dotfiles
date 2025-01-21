return {
  {
    -- Language Server Installer
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },

  {
    -- Mason-LSPConfig Bridge
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
      },
    },
  },
}
