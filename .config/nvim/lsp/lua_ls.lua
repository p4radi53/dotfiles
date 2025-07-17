return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc" },
  telemetry = { enabled = false },
  formatters = {
    ignoreComments = false,
  },
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "vim", "require", "Snacks" },
      },
      workspace = {
        library = { vim.api.nvim_get_runtime_file("", true), "${3rd}/luassert/library" },
        userThirdParty = { os.getenv("HOME") .. ".local/share/lua-addons" },
        checkThirdParty = "Apply",
      },
    },
  },
}
